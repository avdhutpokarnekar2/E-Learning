ActiveAdmin.register User do
  permit_params :role
  permit_params :verified

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :verified
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :email
    column :verified
    actions
  end


  form do |f|
    f.inputs do
      f.input :role, as: :select, collection: User.roles.keys
    end
    f.actions
  end


  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :role
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :mobile_no
      f.input :password
      f.input :password_confirmation
      f.input :role
    end
    f.actions
  end

end
