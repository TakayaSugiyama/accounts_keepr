# frozen_string_literal: true

class User < ApplicationRecord
  include Day
  before_save { email.downcase }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]
  validates :name, presence: true, length: { in: 5..30 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_many :estimate_amounts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_reviews, through: :favorites, source: :review

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    user ||= User.create(name: auth.info.name,
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.info.email,
                          password: Devise.friendly_token[0, 20])
    user
  end

  def get_favorite_id(review)
    favorites.find_by(review_id: review.id)
  end

  def is_like?(review)
    !Favorite.find_by(review_id: review.id, user_id: id).nil?
  end

  def get_data
    data = Hash.new
    user_data = records.where(purchase_date: @@first_day..@@last_day).group(:purchase_date).sum(:purchase_price)
    user_data.each do |date, price|
      data[date] = price
    end
    data
  end

  def get_sum
    records.monthly_cost
  end

  def get_engel
    category= Label.find_by(name: "食費")
    food_cost =  records.category_cost(category.id)
    ((food_cost / get_sum.to_f) * 100).round unless get_sum == 0  
  end

  def get_comparison
    unless get_premonth_sum == 0
      comparison = ((get_sum.to_f / get_premonth_sum) * 100).round
    end
  end

  def get_premonth_sum
    premonth_sum = records.premonth_cost
  end

  def get_chart
    chart = {}
    user_data = records.where(purchase_date: @@first_day..@@last_day).includes(:label).group(:label_id).sum(:purchase_price)
    user_data.each do |label_id, price|
      chart[Label.find(label_id).name] = price
    end
    chart
  end

  def deliver_alert_mail(estimate_amount)
    percent = (get_sum.to_f / estimate_amount.price) * 100
    if (85...100).include?(percent) 
      AlertMailer.alert_mail(self, estimate_amount, get_sum.to_f).deliver
    elsif percent >= 100
      BeyondMailer.beyond_mail(self, estimate_amount, get_sum.to_f).deliver
    end
 end
end
