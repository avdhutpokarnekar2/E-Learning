# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_one_attached :video
  belongs_to :course
end
