# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { 'MyString' }
    article
    user
  end
end
