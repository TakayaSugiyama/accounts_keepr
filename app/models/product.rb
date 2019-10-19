# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :record
  has_one :review, dependent: :destroy
end
