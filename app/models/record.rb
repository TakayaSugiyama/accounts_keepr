# frozen_string_literal: true

require 'csv'
class Record < ApplicationRecord
  include Day
  belongs_to :user
  belongs_to :label
  has_many :memos, dependent: :destroy
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :memos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
  # バリデーション
  validates :store_name, presence: true, length: { maximum: 15 }
  validates :purchase_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10_000_000 }
  validates :purchase_date, presence: true
  # 未来の家計簿は登録できない
  validate :can_not_feature_post

  def can_not_feature_post
    if purchase_date.present? && purchase_date > Date.today
      errors.add(:purchase_date, 'が未来になっています')
    end
  end

  class << self
    def recent_records(user)
      where(user_id: user.id).where(purchase_date: @@first_day..@@last_day).order(purchase_date: :desc).slice(0..2)
    end

    def recods_count_monthly(user)
      where(user_id: user.id).where(purchase_date: @@first_day..@@last_day).count
    end

    def monthly_cost(_first_day, _last_day)
      where(purchase_date: @@first_day..@@last_day).pluck(:purchase_price).sum
    end

    def category_cost(name)
      where(purchase_date: @@first_day..@@last_day).select { |item| item.label.name == name }.map(&:purchase_price).sum
    end

    def premonth_cost
      where(purchase_date: @@premonth_first_day..@@premonth_last_day).pluck(:purchase_price).sum
    end

    def generate_csv
      CSV.generate(headers: true, encoding: Encoding::SJIS) do |csv|
        csv << csv_attributes
        all.find_each do |record|
          csv << csv_attributes.map { |attr| record.send(attr) }
        end
      end
    end

    def csv_attributes
      %w[store_name purchase_price purchase_date]
    end
  end
end
