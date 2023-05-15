# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # Define attributes for the user factory
    first_name { 'avdhut' }
    last_name { 'p' }
    mobile_no { '1234567890' }
    email { 'user@example.com' }
    password { 'password' }
    role { 'instructor' }
  end
end
