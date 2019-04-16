# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { "admin@gmail.com" }
    sequence(:password) { "1234567" }
  end
end
