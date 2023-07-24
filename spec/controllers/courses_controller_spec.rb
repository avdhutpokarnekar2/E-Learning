# frozen_string_literal: true

require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe CoursesController, type: :controller do # rubocop:disable Metrics/BlockLength
  # for index method
  describe 'GET #index' do
    it 'courses' do
      user = FactoryBot.create(:user)
      course = FactoryBot.create(:course, user_id: user.id)
      allow(controller).to receive(:current_user).and_return(user)
      get :index
      expect(response).to be_successful
    end
  end

  # for new method

  describe 'GET #new' do
    before(:each) do
      user = FactoryBot.create(:user)
      FactoryBot.create(:course, name: 'Course 1', user_id: user.id)
      FactoryBot.create(:course, name: 'Course 2', user_id: user.id)
    end
    it 'assigns a new Course to @course' do
      get :new
      expect(assigns(:course)).to be_a_new(Course)
    end

    it 'renders the template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  # for create method

  describe 'POST #create' do # rubocop:disable Metrics/BlockLength
    context 'with invalid parameters' do
      let(:invalid_course_params) do
        {
          name: nil,
          description: 'Lorem ipsum'

        }
      end

      it 'does not create a new course' do
        expect do
          post :create, params: { course: invalid_course_params }
        end.not_to change(Course, :count)
      end

      it 'renders the new template' do
        post :create, params: { course: invalid_course_params }
        expect(response).to render_template(:new)
      end

      it 'sets an unprocessable entity status' do
        post :create, params: { course: invalid_course_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with valid parameters' do
      let(:user) {create(:user)}
      let(:valid_course_params) do
        {
          name: 'Sample Course',
          description: 'Lorem ipsum',
          fees: 910,
          duration: 3,
          course_type: 1,
          user_id: user.id,
          start_date: DateTime.new(2023, 7, 6, 12, 57, 0, '+00:00')
        }
      end
      it 'creates a new course' do
        expect do
          post :create, params: { course: valid_course_params }
        end.to change(Course, :count).by(1)
      end
      it 'assigns a newly created course to @course' do
        post :create, params: { course: valid_course_params }
        expect(assigns(:course)).to be_a(Course)
      end

      it 'redirects to the created course' do
        post :create, params: { course: valid_course_params }
        expect(response).to redirect_to(course_url(assigns(:course)))
      end

      it 'sets a success notice' do
        post :create, params: { course: valid_course_params }
        expect(flash[:notice]).to eq('Course was successfully created.')
      end
    end
  end

  # for upadate method

  describe 'PATCH #update' do # rubocop:disable Metrics/BlockLength
    let(:user) {create(:user)}
    let(:course) { FactoryBot.create(:course, user_id: user.id) } # Assuming you're using FactoryBot for test data creation

    context 'with valid parameters' do
      let(:updated_course_params) do
        {
          name: 'Updated Course',
          description: 'New description'
        }
      end

      it 'updates the course' do
        patch :update, params: { id: course.id, course: updated_course_params }
        course.reload
        expect(course.name).to eq(updated_course_params[:name])
        expect(course.description).to eq(updated_course_params[:description])
      end

      it 'redirects to the updated course' do
        patch :update, params: { id: course.id, course: updated_course_params }
        expect(response).to redirect_to(course_url(course))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_course_params) do
        {
          name: '',
          description: ''
        }
      end

      it 'renders the edit template' do
        patch :update, params: { id: course.id, course: invalid_course_params }
        expect(response).to render_template(:edit)
      end

      it 'sets an unprocessable entity status' do
        patch :update, params: { id: course.id, course: invalid_course_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # for delete method

  describe 'DELETE #destroy' do
    let(:user) {create(:user)}
    let!(:course) { FactoryBot.create(:course, user_id: user.id) } # Assuming you're using FactoryBot for test data creation

    it 'destroys the course' do
      expect do
        delete :destroy, params: { id: course.id }
      end.to change(Course, :count).by(-1)
    end

    it 'redirects to the courses index' do
      delete :destroy, params: { id: course.id }
      expect(response).to redirect_to(courses_url)
    end

    it 'sets a success notice' do
      delete :destroy, params: { id: course.id }
      expect(flash[:notice]).to eq('Course was successfully destroyed.')
    end

    it 'returns no content for JSON format' do
      delete :destroy, params: { id: course.id, format: :json }
      expect(response).to have_http_status(:no_content)
      expect(response.body).to be_blank
    end
  end
end
