FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "test_user#{n}"}
    sequence(:email) {|n|  "test#{n}@railstest.org"}
    password {"testtest"}
    password_confirmation {"testtest"}
  end
end
