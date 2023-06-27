# frozen_string_literal: true

# This is questions migration
class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :answer
      t.jsonb :option
      t.references :assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
