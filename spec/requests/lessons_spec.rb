# spec/controllers/lessons_controller_spec.rb

require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  let(:user) { create(:user) }
  let(:course) { create(:course, user_id: user.id) }

  before do
    sign_in user
  end
  describe 'GET #index' do
    it 'renders the index template' do
      get :index, params: { course_id: course}
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new, params: { course_id: course.id }
      expect(response).to render_template(:new)
    end
  end


  describe 'POST #create' do
    let(:valid_lesson_params) do
      {
        name: 'Sample Lesson',
        course_id: course.id
      }
    end

    context 'with valid parameters' do
      it 'creates a new lesson' do
        expect {
          post :create, params: { course_id: course.id, lesson: valid_lesson_params }
        }.to change(Lesson, :count).by(1)

        expect(response).to redirect_to(courses_path)
      end
    end  
  end

  describe 'PATCH #update' do
    let(:lesson) { create(:lesson, course_id: course.id) }
    context 'with valid parameters' do
      it 'updates the requested lesson' do
        new_name = 'Updated Lesson'
        patch :update, params: { course_id: course.id, id: lesson.id, lesson: { name: new_name } }
        expect(response).to redirect_to(course_lesson_url(lesson))
        lesson.reload
        expect(lesson.name).to eq(new_name)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the requested lesson' do
        original_name = lesson.name
        patch :update, params: { course_id: course.id, id: lesson.id, lesson: { name: '' } }
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:unprocessable_entity)
        lesson.reload
        expect(lesson.name).to eq(original_name)
      end
    end
  end

# ...

  # describe 'DELETE #destroy' do
  #   let!(:lesson) { create(:lesson, course_id: course.id) }
  #   it 'redirects to the lesson index' do
  #     delete :destroy, params: { course_id: course.id, id: lesson.id }
  #     expect(response).to redirect_to(courses_path)
  #   end
  # end
end
