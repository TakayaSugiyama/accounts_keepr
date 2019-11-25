# frozen_string_literal: true

class EstimateAmount < ApplicationRecord
  belongs_to :user
  validates :price, numericality: { greater_than: 0 } # 0円以上

  # 日付のデータ
  @@today = Date.today
  @@last_day = Date.new(@@today.year, @@today.month, -1).strftime('%Y-%m-%d')
  @@first_day = Date.new(@@today.year, @@today.month).strftime('%Y-%m-%d')
  @@premonth_first_day = (Date.new(@@today.year, @@today.month) << 1).strftime('%Y-%m-%d')
  @@premonth_last_day = (Date.new(@@today.year, @@today.month, -1) << 1).strftime('%Y-%m-%d')

  def self.target_amount(user)
    find_by(month: @@today.month, year: @@today.year, user: user)
  end

  def self.get_monthly_goal(user)
    find_by(user_id: user.id, year: @@today.year, month: @@today.month)
  end
end
