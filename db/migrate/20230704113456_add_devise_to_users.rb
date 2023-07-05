class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :email, :string unless column_exists?(:users, :email)
    # Other migration steps...
  end

  def down
    # Migration rollback steps...
    remove_column :users, :email if column_exists?(:users, :email)
  end
end
