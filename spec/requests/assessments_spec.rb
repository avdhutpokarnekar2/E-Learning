require 'rails_helper'

RSpec.describe AssessmentsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:course) { FactoryBot.create(:course, user_id: user.id) }
  let(:assignment) { FactoryBot.create(:assignment, course_id: course.id) }
  let(:assessment) { FactoryBot.create(:assessment, user_id: user.id, assignment_id: assignment.id) }

  describe 'GET #index' do
    before { FactoryBot.create_list(:assessment, 2, user_id: user.id, assignment_id: assignment.id) }

    it 'assigns all assessments to @assessments' do
      get :index
      expect(assigns(:assessments)).to match_array(Assessment.all)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested assessment to @assessment' do
      get :show, params: { id: assessment.id }
      expect(assigns(:assessment)).to eq(assessment)
    end

    it 'renders the show template' do
      get :show, params: { id: assessment.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    before { get :new, params: { id: course.id } }

    it 'assigns a new Assessment to @assessment' do
      expect(assigns(:assessment)).to be_a_new(Assessment)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with invalid parameters' do
      let(:invalid_params) { { assessment: { invalid: 'params' } } }

      it 'does not create a new assessment and renders the new template' do
        expect {
          post :create, params: invalid_params
        }.not_to change(Assessment, :count)

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      let(:updated_params) { { grade: 90 } }

      it 'updates the assessment' do
        patch :update, params: { id: assessment.id, assessment: updated_params }
        expect(assigns(:assessment)).to eq(assessment)

        assessment.reload
        expect(assessment.grade.to_i).to eq(90)
      end

      it 'redirects to the assessment page' do
        patch :update, params: { id: assessment.id, assessment: updated_params }
        expect(response).to redirect_to(assessment_url(assessment))
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'redirects to the assessments index page' do
      delete :destroy, params: { id: assessment.id }
      expect(response).to redirect_to(assessments_url)
    end
  end
end
