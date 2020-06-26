# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@mail.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
