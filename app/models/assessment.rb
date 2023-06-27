# frozen_string_literal: true

# Assessment model
class Assessment < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
end
