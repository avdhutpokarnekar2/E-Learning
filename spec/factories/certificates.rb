FactoryBot.define do
  factory :certificate do
    grade { "MyString" }
    user { nil }
    course { nil }
  end
end
