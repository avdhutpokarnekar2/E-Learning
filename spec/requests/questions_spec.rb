# spec/controllers/questions_controller_spec.rb

require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:user) {create(:user)}
  let(:course) { create(:course, user_id: user.id)}
  let(:assignment) { create(:assignment, course_id: course.id) }
  let(:valid_question_params) do
    {
      title: 'Sample Question',
      answer: 'Sample Answer',
      assignment_id: assignment.id,
      option: { a: 'Option A', b: 'Option B', c: 'Option C', d: 'Option D' }
    }
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new question' do
        post :create, params: { assignment_id: assignment.id, question: valid_question_params }
        expect(response).to redirect_to(assignment_question_path(assignment, Question.last))
        expect(flash[:notice]).to eq('Question was successfully created.')
      end
    end
  end

  describe 'PATCH #update' do
    let(:question) { create(:question, assignment_id: assignment.id) }
    it 'updates the requested question' do
      new_title = 'Updated Question'
      patch :update, params: { assignment_id: assignment.id, id: question.id, question: { title: new_title } }

      expect(response).to redirect_to(assignment_questions_path(question))
      expect(flash[:notice]).to eq('Question was successfully updated.')
      question.reload
      expect(question.title).to eq(new_title)
    end
  end

  describe 'DELETE #destroy' do
    let!(:question) { create(:question, assignment_id: assignment.id) }

    it 'destroys the requested question' do
      delete :destroy, params: { assignment_id: assignment.id, id: question.id }
      expect(response).to redirect_to(assignment_questions_path)
      expect(flash[:notice]).to eq('Question was successfully destroyed.')
    end
  end
end
