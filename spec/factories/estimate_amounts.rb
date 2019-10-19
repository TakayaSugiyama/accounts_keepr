# frozen_string_literal: true

FactoryBot.define do
  factory :estimate_amount do
    user { nil }
    month { 1 }
    price { 1 }
  end
end
