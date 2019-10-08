class Memo < ApplicationRecord
  belongs_to :record 
  validates :content , length: {maximum: 140}
end
