class Record < ApplicationRecord
  belongs_to :user
  has_many :memos
  accepts_nested_attributes_for :memos, reject_if: :all_blank, allow_destroy: true
end
