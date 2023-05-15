# frozen_string_literal: true

# course model
class Course < ApplicationRecord
  validates :name, :description, :fees, :duration, presence: true
  validates :fees, numericality: { only_integer: true }
end
