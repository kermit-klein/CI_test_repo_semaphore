FactoryBot.define do
  factory :comment do
    body { "MyString" }
    article { nil }
    user { nil }
  end
end
