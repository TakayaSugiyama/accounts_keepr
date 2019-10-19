# frozen_string_literal: true

FactoryBot.define do
  factory :memo do
    content { 'MyText' }
    user { nil }
    transaction { '' }
  end
end
