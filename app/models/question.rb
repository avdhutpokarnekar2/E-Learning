# frozen_string_literal: true

# Question model
class Question < ApplicationRecord
  belongs_to :assignment
end
