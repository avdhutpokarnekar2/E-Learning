class CreateActiveAdminComments < ActiveRecord::Migration[7.0]
  def up
    unless table_exists?(:active_admin_comments)
      create_table :active_admin_comments do |t|
        # Define table columns and other configurations
        # ...
      end
    end
  end

  def down
    drop_table :active_admin_comments, if_exists: true
  end
end
