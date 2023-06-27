# frozen_string_literal: true

# Assignment model
class Assignment < ApplicationRecord
  belongs_to :course
  has_one :assessment, dependent: :destroy
  has_many :questions, dependent: :destroy
end
