ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :mobile_no, :role, :verified

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :mobile_no
      f.input :role, as: :select, collection: User.roles.keys
      f.input :verified
    end
    f.actions
  end


  member_action :verify, method: :put do
    user = User.find(params[:id])
    user.update(verified: true)
    redirect_to admin_user_path(user), notice: 'Instructor verified!'
  end

  action_item :verify, only: :show do
    link_to 'Verify', verify_admin_user_path(user), method: :put if user.instructor? && !user.verified?
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
