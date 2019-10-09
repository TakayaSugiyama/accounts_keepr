class Product < ApplicationRecord
  belongs_to :record 
  has_many :images, dependent: :destroy
end
