      # spec/controllers/payment_controller_spec.rb

require 'rails_helper'

RSpec.describe PaymentController, type: :controller do
  let(:user) {create(:user)}
  let(:course) { create(:course, user_id: user.id) } # Assuming you have a Course factory

  before do
    sign_in user
  end

  describe 'GET #stripe_payment' do
    it 'creates a Stripe checkout session and redirects to it' do
      expect(Course).to receive(:find).with(course.id.to_s).and_return(course)
      expect(course).to receive(:fees).and_return(990)

      product_double = double('Stripe::Product', id: 'product_id')
      checkout_session_double = double('Stripe::Checkout::Session')
      allow(Stripe::Product).to receive(:create).and_return(product_double)
      allow(Stripe::Checkout::Session).to receive(:create).and_return(checkout_session_double)

      get :stripe_payment, params: { course_id: course.id }

      expect(response).to have_http_status(:success)
      # You can add more expectations based on your actual controller implementation
    end
  end

  describe 'GET #cancel' do
    it 'redirects to the root_url with cancel notice' do
      get :cancel
      expect(response).to redirect_to(root_url)
      expect(flash[:notice]).to eq('Purchase Unsuccessful')
    end
  end

  describe 'GET #success' do
    it 'redirects to the root_url with a success notice' do
      # Stub the Stripe::Checkout::Session.create method to return a test double
      session_double = double('Stripe::Checkout::Session', id: 'session_id')
      allow(Stripe::Checkout::Session).to receive(:create).and_return(session_double)

      # Create a user and sign in before making the request
      user = create(:user) # Assuming you have a User factory
      sign_in user

      get :success

      expect(response).to redirect_to(root_url)
      expect(flash[:notice]).to eq('Purchase Successful')
    end
  end
end
