# frozen_string_literal: true

FactoryBot.define do
  factory :record do
    sequence(:store_name) { |n| "store_#{n}" }
    association :user
    association :label
    purchase_price { 1000 }
    purchase_date { Date.today.strftime('%Y-%m-%d') }
  end
end
