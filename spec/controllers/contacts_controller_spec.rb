# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactsController, type: :controller do # rubocop:disable Metrics/BlockLength
  describe 'GET #index' do
    
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#create' do
    let(:params) do
      {
        name: 'John',
        email: 'john@example.com',
        contact_no: '1234567890',
        message: 'Hello world'
      }
    end

    it 'creates a new contact' do
      expect do
        post :create, params: params
      end.to change(Contact, :count).by(1)
    end

    it 'redirects to root path' do
      post :create, params: params
      expect(response).to redirect_to(root_path)
    end

    it 'sets a flash notice' do
      post :create, params: params
      expect(flash[:notice]).to eq('Contact form saved successfully.')
    end

  end
end
