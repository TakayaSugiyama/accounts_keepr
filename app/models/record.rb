class Record < ApplicationRecord
  belongs_to :user
  has_many :memos ,dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :labels, through: :label_relations
  accepts_nested_attributes_for :memos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
  #バリデーション 
  validates :store_name, presence: true 
  validates :purchase_price,presence: true 
  validates :purchase_date,presence: true
end
