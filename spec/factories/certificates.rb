FactoryBot.define do
  factory :certificate do
    grade { "4" }
    association :user
    association :course
  end
end
