# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    title { 'MyString' }
    content { 'MyText' }
    product { nil }
    user { nil }
  end
end
