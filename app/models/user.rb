# frozen_string_literal: true

# user_model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { student: 0, instructor: 1, admin: 2 }
  validates :first_name, :last_name, :mobile_no, :email, presence: true
end
