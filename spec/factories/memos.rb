# frozen_string_literal: true

FactoryBot.define do
  factory :memo do
    sequence(:content) { |n| "test_content#{n}" }
    association :record
  end
end
