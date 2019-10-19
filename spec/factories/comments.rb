# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    review { nil }
    content { 'MyText' }
    user { '' }
  end
end
