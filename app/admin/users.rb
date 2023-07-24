# frozen_string_literal: true

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
end
