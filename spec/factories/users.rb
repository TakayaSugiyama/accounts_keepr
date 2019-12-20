# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_user#{n}" }
    sequence(:email) { |n| "test#{n}@railstest.org" }
    password { 'testtest' }
    password_confirmation { 'testtest' }
  end

  factory :google_user, class: User do
    name { 'google_user' }
    email { 'test@google.com' }
    password { 'aaaaaaaaaa' }
    password_confirmation { 'aaaaaaaaaa' }
    provider { 'google_oauth2' }
    uid      { 12345 }
  end
end
