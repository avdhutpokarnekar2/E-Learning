# frozen_string_literal: true

# Enrollment model
class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course
end
