# frozen_string_literal: true

# contact
class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :contact_no, :string
      t.column :message, :text
      t.timestamps
    end
  end
end
