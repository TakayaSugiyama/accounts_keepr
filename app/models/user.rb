class User < ApplicationRecord
  before_save {self.email.downcase}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]
  validates :name , presence: true, length: {in: 5..23}
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_many :estimate_amounts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites , dependent: :destroy
  has_many :favorite_reviews, through: :favorites,  source: :review

  def is_like?(review) 
    if Favorite.find_by(review_id: review.id , user_id: self.id) 
      true  
    else 
      false 
    end
  end 

  def get_favorite_id(review)
    self.favorites.find_by(review_id: review.id)
  end

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.create(name:     "user_name",
                         provider: auth.provider,
                         uid:      auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0, 20])
    end 
    user
  end

end
