# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    review { nil }
    user { nil }
  end
end
