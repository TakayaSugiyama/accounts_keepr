class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save {self.email.downcase}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name , presence: true, length: {in: 5..10}
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_many :estimate_amounts
  has_many :comments
  has_many :records, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites 
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

end
