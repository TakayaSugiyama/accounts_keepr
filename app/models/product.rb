class Product < ApplicationRecord
  belongs_to :record 
  has_one :review
  has_many :images, dependent: :destroy
end
