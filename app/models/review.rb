class Review < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  belongs_to :product
  has_many :comments, dependent: :destroy
  has_many :favorites , dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true 
  validates :title, presence: true, length: {in: 5..20}
  validates :content,presence: true, length: {maximum: 385}
  validates :rating, presence: true, length: {minimum: 1}
end
