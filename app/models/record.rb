class Record < ApplicationRecord
  belongs_to :user
  has_many :memos 
  has_many :products
  accepts_nested_attributes_for :memos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
end
