# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :course
  has_many :questions, dependent: :destroy
end
