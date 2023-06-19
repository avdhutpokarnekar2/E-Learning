# frozen_string_literal: true

class AddUserIdtoLesson < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :course, null: false, foreign_key: true
  end
end
