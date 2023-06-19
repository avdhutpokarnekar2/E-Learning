# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    name {"lesson"}
    association :course
  end
end
