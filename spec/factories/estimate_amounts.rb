# frozen_string_literal: true

FactoryBot.define do
  factory :estimate_amount do
    association :user
    month { Date.today.month }
    year { Date.today.year }
    price { 10_000 }
  end
end
