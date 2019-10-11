FactoryBot.define do
  factory :comment do
    review { nil }
    content { "MyText" }
    user { "" }
  end
end
