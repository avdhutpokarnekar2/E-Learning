# frozen_string_literal: true

# This is lessons migration
class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.timestamps
    end
  end
end
