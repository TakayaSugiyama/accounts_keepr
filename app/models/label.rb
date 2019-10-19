# frozen_string_literal: true

class Label < ApplicationRecord
  has_many :records, dependent: :destroy
end
