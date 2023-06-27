# frozen_string_literal: true

FactoryBot.define do
  factory :assessment do
    question_set { '' }
    grade { 'MyString' }
    assignment { nil }
    user { nil }
  end
end
