# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :review
  belongs_to :user
end
