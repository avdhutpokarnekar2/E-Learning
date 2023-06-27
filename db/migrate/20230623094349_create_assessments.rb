# frozen_string_literal: true

# This is assessment migration
class CreateAssessments < ActiveRecord::Migration[7.0]
  def change
    create_table :assessments do |t|
      t.jsonb :question_set
      t.string :grade
      t.references :assignment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
