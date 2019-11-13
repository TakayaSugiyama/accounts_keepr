# frozen_string_literal: true

class User < ApplicationRecord
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

  # 日付のデータ
  @@today = Date.today
  @@last_day = Date.new(@@today.year, @@today.month, -1).strftime('%Y-%m-%d')
  @@first_day = Date.new(@@today.year, @@today.month).strftime('%Y-%m-%d')
  @@premonth_first_day = (Date.new(@@today.year, @@today.month) << 1).strftime('%Y-%m-%d')
  @@premonth_last_day = (Date.new(@@today.year, @@today.month, -1) << 1).strftime('%Y-%m-%d')

  # 日付を返す
  def self.get_today
    @@today
  end

  def self.get_first_day
    @@first_day
  end

  def self.get_last_day
    @@last_day
  end

  def self.get_premonth_first_day
    @@premonth_first_day
  end

  def self.get_premonth_last_day
    @@premonth_last_day
  end

  def is_like?(review)
    if Favorite.find_by(review_id: review.id, user_id: id)
      true
    else
      false
    end
  end

  def get_favorite_id(review)
    favorites.find_by(review_id: review.id)
  end

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    user ||= User.create(name: auth.info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0, 20])
    user
  end

  def get_data
    data = {}
    [*@@first_day..@@last_day].each do |day|
      data[day.to_s] = records.where(purchase_date: day).pluck(:purchase_price).sum
    end
    data
  end

  def get_sum
    sum = records.monthly_cost(@@first_day, @@last_day)
  end

  def get_engel
    food_cost = records.category_cost('食費', @@first_day, @@last_day)
    engel = ((food_cost / get_sum.to_f) * 100).round if get_sum != 0
  end

  def get_comparison
    unless get_premonth_sum == 0
      comparison = ((get_sum.to_f / get_premonth_sum) * 100).round
    end
  end

  def get_premonth_sum
    premonth_sum = records.premonth_cost(@@premonth_first_day, @@premonth_last_day)
  end

  def get_chart
    chart = {}
    user_data = records.where(purchase_date: @@first_day..@@last_day).includes(:label)
    user_data.each do |data|
      chart[data.label.name] = data.label.records.where(user_id: id).pluck(:purchase_price).sum
    end
    chart
  end
end
