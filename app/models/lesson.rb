# frozen_string_literal: true

# Lesson model
class Lesson < ApplicationRecord
  has_one_attached :video, dependent: :destroy
  belongs_to :course
  validates_presence_of :name
end
