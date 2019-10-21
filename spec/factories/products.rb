# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'test_product' }
    price { 1000 }
    association :record
  end
end
