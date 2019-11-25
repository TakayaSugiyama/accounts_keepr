# frozen_string_literal: true

class EstimateAmount < ApplicationRecord
  include Day
  belongs_to :user
  validates :price, numericality: { greater_than: 0 } # 0円以上


  def self.target_amount(user)
    find_by(month: @@today.month, year: @@today.year, user: user)
  end

  def self.get_monthly_goal(user)
    find_by(user_id: user.id, year: @@today.year, month: @@today.month)
  end
end
