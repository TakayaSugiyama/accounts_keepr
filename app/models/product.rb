class Product < ApplicationRecord
  belongs_to :record 
  has_one :review, dependent: :destroy
  has_many :images, dependent: :destroy
end
