# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :controller do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        expect do
          post :create, params: {
            user: {
              email: 'test@example.com',
              password: 'password',
              password_confirmation: 'password'
            }
          }
        end.to change(User, :count).by(1)
      end

      it 'redirects to the root path' do
        post :create, params: {
          user: {
            email: 'test@example.com',
            password: 'password',
            password_confirmation: 'password'
          }
        }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
