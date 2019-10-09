FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyText" }
    product { nil }
    user { nil }
  end
end
