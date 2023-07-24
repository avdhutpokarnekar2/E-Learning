# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe Devise::RegistrationsController, type: :controller do
#   before do
#     request.env['devise.mapping'] = Devise.mappings[:user]
#   end
#   describe 'POST#create' do
#     context 'with valid parameters' do
#       it 'create new session for user' do
#         post :create, params: {
#           user: {
#             email: 'test@example.com',
#             password: 'password'
#           # 
#         }
#         expect(response).to redirect_to(root_path)
#       end
#       it 'signs in the user' do
#         sign_in user
#         post :create, params: { user: { email: 'test@example.com', password: 'password' } }
#         expect(controller.current_user).to eq(:user)
#       end
#     end
#   end
# end
