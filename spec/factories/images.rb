# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    image { 'MyString' }
    product { nil }
  end
end
