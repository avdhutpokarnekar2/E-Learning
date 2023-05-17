# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileController, type: :controller do # rubocop:disable Metrics/BlockLength
  describe 'PATCH #update' do # rubocop:disable Metrics/BlockLength
    let!(:user) { FactoryBot.create(:user) } # Assuming you're using FactoryBot for test data creation

    context 'with valid parameters' do
      let(:updated_user_params) do
        {
          first_name: 'avdhut',
          last_name: 'p',
          mobile_no: '1234567890',
          email: 'user@example.com'
        }
      end

      it 'updates the user' do
        patch :update, params: { id: user.id, user: updated_user_params }
        user.reload
        expect(user.first_name).to eq(updated_user_params[:first_name])
        expect(user.last_name).to eq(updated_user_params[:last_name])
        expect(user.mobile_no).to eq(updated_user_params[:mobile_no])
        expect(user.email).to match(/\A[\w+\-.]+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i)
      end

      it 'redirects to the profile index page' do
        patch :update, params: { id: user.id, user: updated_user_params }
        expect(response).to redirect_to(profile_index_path(user))
      end

      it 'sets a success notice' do
        patch :update, params: { id: user.id, user: updated_user_params }
        expect(flash[:notice]).to eq('User successfully updated.')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_user_params) do
        {
          first_name: '',
          last_name: '',
          mobile_no: '',
          email: ''
          # Include other parameters with invalid values
        }
      end

      it 'redirects to the profile index page' do
        patch :update, params: { id: user.id, user: invalid_user_params }
        expect(response).to redirect_to(profile_index_path(user))
      end
    end
  end
end
