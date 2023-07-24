class AddResourceTypeToActiveAdminComments < ActiveRecord::Migration[7.0]
  def change
    add_column :active_admin_comments, :resource_type, :string
  end
end
