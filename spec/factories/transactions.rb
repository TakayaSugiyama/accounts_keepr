FactoryBot.define do
  factory :transaction do
    store_name { "MyString" }
    user { nil }
    purchase_price { 1 }
    purchase_date { "2019-10-07" }
  end
end
