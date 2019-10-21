# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    image { 'review.jpg' }
    association :review
  end
end
