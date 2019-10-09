class EstimateAmount < ApplicationRecord
  belongs_to :user
  validates :price, numericality: {greater_than: 0}  # 0円以上
end
