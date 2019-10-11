class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true 
  validates :title, presence: true, length: {in: 5..20}
  validates :content, length: {maximum: 385}
  validates :rating, presence: true, length: {minimum: 1}
end
