# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_one_attached :video, dependent: :destroy
  belongs_to :course, dependent: :destroy

  validates_presence_of :name
end
