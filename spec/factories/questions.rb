# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    title { 'MyString' }
    answer { 'MyString' }
    option { '' }
    assignment { nil }
  end
end
