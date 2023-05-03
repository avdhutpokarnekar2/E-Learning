# frozen_string_literal: true

# courses
class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :fees
      t.integer :course_type
      t.integer :duration
      t.datetime :start_date

      t.timestamps
    end
  end
end
