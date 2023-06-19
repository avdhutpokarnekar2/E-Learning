# frozen_string_literal: true

class Enrollment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :course, dependent: :destroy
end
