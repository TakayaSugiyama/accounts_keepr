# frozen_string_literal: true

require 'csv'
class Record < ApplicationRecord
  belongs_to :user
  belongs_to :label
  has_many :memos, dependent: :destroy
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :memos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
  # バリデーション
  validates :store_name, presence: true
  validates :purchase_price, presence: true
  validates :purchase_date, presence: true

  # CSV
  def self.csv_attributes
    %w[store_name purchase_price purchase_date]
  end

  def self.generate_csv
    CSV.generate(headers: true,encoding:Encoding::SJIS ) do |csv|
      csv << csv_attributes
      all.find_each do |record|
        csv << csv_attributes.map { |attr| record.send(attr) }
      end
    end
  end
  
end
