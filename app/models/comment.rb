class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates :content , presence: true, length: {maximum: 200}
end
