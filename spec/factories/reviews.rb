# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    sequence(:title) { |n| "test_title#{n}" }
    sequence(:content) { |n| "test_content#{n}" }
    rating { (1..5).to_a.sample }
    association :product
    association :user
  end
end
