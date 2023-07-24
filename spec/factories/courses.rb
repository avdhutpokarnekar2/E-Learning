# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { 'Introduction to Ruby' }
    description { 'Learn the basics of Ruby programming' }
    fees { 990 }
    duration { 3 }
    association :user
  end
end
