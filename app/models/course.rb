# frozen_string_literal: true

# course model
class Course < ApplicationRecord
  validates :name, :description, :fees, :duration, presence: true
  validates :fees, numericality: { only_integer: true }
  has_one_attached :image, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :users, through: :enrollments, dependent: :destroy
  has_many :assignments, dependent: :destroy
end
