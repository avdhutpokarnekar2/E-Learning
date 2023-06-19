# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'avdhut' }
    last_name { 'p' }
    mobile_no { '1234567890' }
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
    role { 'instructor' }
  end
end
