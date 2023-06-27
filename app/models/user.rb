# frozen_string_literal: true

# user_model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { student: 0, instructor: 1, admin: 2 }

  has_many :enrollments, dependent: :destroy
  has_many :assessments, dependent: :destroy
  has_many :courses, through: :enrollments, dependent: :destroy
end
