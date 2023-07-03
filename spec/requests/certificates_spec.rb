require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/certificates", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Certificate. As you add validations to Certificate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Certificate.create! valid_attributes
      get certificates_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      certificate = Certificate.create! valid_attributes
      get certificate_url(certificate)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      certificate = Certificate.create! valid_attributes
      get edit_certificate_url(certificate)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Certificate" do
        expect {
          post certificates_url, params: { certificate: valid_attributes }
        }.to change(Certificate, :count).by(1)
      end

      it "redirects to the created certificate" do
        post certificates_url, params: { certificate: valid_attributes }
        expect(response).to redirect_to(certificate_url(Certificate.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Certificate" do
        expect {
          post certificates_url, params: { certificate: invalid_attributes }
        }.to change(Certificate, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post certificates_url, params: { certificate: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested certificate" do
        certificate = Certificate.create! valid_attributes
        patch certificate_url(certificate), params: { certificate: new_attributes }
        certificate.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the certificate" do
        certificate = Certificate.create! valid_attributes
        patch certificate_url(certificate), params: { certificate: new_attributes }
        certificate.reload
        expect(response).to redirect_to(certificate_url(certificate))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        certificate = Certificate.create! valid_attributes
        patch certificate_url(certificate), params: { certificate: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested certificate" do
      certificate = Certificate.create! valid_attributes
      expect {
        delete certificate_url(certificate)
      }.to change(Certificate, :count).by(-1)
    end

    it "redirects to the certificates list" do
      certificate = Certificate.create! valid_attributes
      delete certificate_url(certificate)
      expect(response).to redirect_to(certificates_url)
    end
  end
end
