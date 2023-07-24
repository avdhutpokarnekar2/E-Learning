# spec/controllers/certificates_controller_spec.rb

require 'rails_helper'

RSpec.describe CertificatesController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a User factory
  let(:course) { create(:course, user_id: user.id) } # Assuming you have a Course factory
  let(:certificate) { create(:certificate, user_id: user.id, course_id: course.id) } # Assuming you have a Certificate factory

  before do
    sign_in user
  end


  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: certificate.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_certificate_params) do
      {
        grade: 'A',
        user_id: user.id,
        course_id: course.id
      }
    end

    context 'with valid parameters' do
      it 'creates a new certificate' do
        expect {
          post :create, params: { certificate: valid_certificate_params }
        }.to change(Certificate, :count).by(1)

        expect(response).to redirect_to(certificate_path(assigns(:certificate)))
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested certificate' do
        new_grade = 'B'
        patch :update, params: { id: certificate.id, certificate: { grade: new_grade } }
        expect(response).to redirect_to(certificate_path(assigns(:certificate)))
        certificate.reload
        expect(certificate.grade).to eq(new_grade)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested certificate' do
      delete :destroy, params: { id: certificate.id }
      expect(response).to redirect_to(certificates_path)
    end
  end

  describe 'GET #generate_certificate' do
    it 'renders PDF format' do
      get :generate_certificate, params: { id: certificate.id, format: 'pdf' }
      expect(response.header['Content-Type']).to eq('application/pdf')
    end
  end
end
