# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  belongs_to :product
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
  validates :title, presence: true, length: { in: 5..20 }
  validates :content, presence: true, length: { maximum: 385 }
  validates :rating, presence: true, length: { minimum: 1 }

  PER = 8

  def get_images
    images = []
    self.images.pluck(:image).map do |image|
      images.push(image.image.url)
    end
  end

  def self.get_index_reviews
    order(created_at: :desc).includes(:images).select(:id, :rating, :title)
  end
end
