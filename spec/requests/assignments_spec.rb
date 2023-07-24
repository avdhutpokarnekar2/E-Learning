# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/assignments', type: :request do

  describe 'GET /index' do
    it 'assignment' do
      user = FactoryBot.create(:user)
      course = FactoryBot.create(:course, user_id: user.id)
      assignment = FactoryBot.create(:assignment, course_id: course.id)
      get assignments_url(course_id: course.id)
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:user) { FactoryBot.create(:user) }
    let(:course) { FactoryBot.create(:course, user_id: user.id) }
    let(:params) { FactoryBot.create(:assignment, course_id: course.id ) }

    context 'with invalid parameters' do
      let(:invalid_params) { { assignment: { name: '' }, course_id: course.id } }

      it 'does not create a new assignment' do
        expect {
          post '/assignments', params: invalid_params
        }.not_to change(Assignment, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        post '/assignments', params: invalid_params
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end


  describe 'GET #show' do
    let(:user) { FactoryBot.create(:user) }
    let(:course) { FactoryBot.create(:course, user_id: user.id) }
    let(:assignment) { FactoryBot.create(:assignment, course_id: course.id ) }

    it 'assigns the requested assignment to @assignment' do
      get "/assignments/#{ assignment.id }", params: { id: assignment.id }
      expect(assigns(:assignment)).to eq(assignment)
    end

    it 'renders the show template' do
     get "/assignments/#{ assignment.id }", params: { id: assignment.id }
      expect(response).to render_template(:show)
    end

    it 'returns a success response' do
      get "/assignments/#{ assignment.id }", params: { id: assignment.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    let(:user) { FactoryBot.create(:user) }
    let(:course) { FactoryBot.create(:course, user_id: user.id) }
    let(:assignment) { FactoryBot.create(:assignment, course_id: course.id ) }

    context 'with valid parameters' do
      let(:valid_params) { { name: 'Updated Assignment' } }

      it 'updates the assignment' do
        patch assignment_url(assignment), params: { assignment: valid_params }
        expect(assignment.reload.name).to eq('Updated Assignment')
      end

      it 'redirects to the assignment page' do
        patch assignment_url(assignment), params: { id: assignment.id, assignment: valid_params }
        expect(response).to redirect_to(assignment_url(assignment))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { name: nil } }

      it 'does not update the assignment' do
        patch assignment_url(assignment), params: { id: assignment.id, assignment: invalid_params }
        expect(assigns(:assignment)).to eq(assignment)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { FactoryBot.create(:user) }
    let(:course) { FactoryBot.create(:course, user_id: user.id) }
    let(:assignment) { FactoryBot.create(:assignment, course_id: course.id ) }

    it 'redirects to assignments index' do
      delete assignment_url(assignment), params: { id: assignment.id }
      expect(response).to redirect_to(assignments_url)
    end
  end
end
