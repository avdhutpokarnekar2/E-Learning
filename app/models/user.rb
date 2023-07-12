# frozen_string_literal: true

# user_model
class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :registerable

  enum role: { student: 0, instructor: 1, admin: 2 }

  has_many :enrollments, dependent: :destroy
  has_many :assessments, dependent: :destroy
  has_many :courses, through: :enrollments, dependent: :destroy

  attribute :verified, :boolean, default: false
end
