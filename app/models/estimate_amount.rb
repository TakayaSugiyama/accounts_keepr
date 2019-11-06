# frozen_string_literal: true

class EstimateAmount < ApplicationRecord
  belongs_to :user
  validates :price, numericality: { greater_than: 0 } # 0円以上

  def self.target_amount(user)
     find_by(month: Date.today.month, year: Date.today.year, user: user)
  end

end
