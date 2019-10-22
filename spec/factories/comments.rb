# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :review
    content {Faker::Quote.famous_last_words}
    association :user
  end
end
