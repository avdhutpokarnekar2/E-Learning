# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lessons', type: :request do 

  describe "GET #index" do
    it "returns a successful response" do
      get "/lessons"
      expect(response).to have_http_status(:success)
    end

    it "assigns @lessons with all lessons" do
      course = FactoryBot.create(:course)
      lesson1 = FactoryBot.create(:lesson, course_id: course.id)
      lesson2 = FactoryBot.create(:lesson, course_id: course.id)
      get "/lessons"
      expect(assigns(:lessons)).to eq([lesson1, lesson2])
    end

    it "renders the index template" do
      get "/lessons"
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #new' do
    it 'assigns a new Lesson to @lessons' do
      get "/lessons/new"
      expect(assigns(:lesson)).to be_a_new(Lesson)
    end

    it 'renders the template' do
      get "/lessons/new"
      expect(response).to render_template(:new)
    end
  end

  describe 'Post #create' do
    context 'with invalid parameters' do
      let(:invalid_lessons_params) do
        {
          name: nil
        }
      end

      it 'does not create a new lesson' do
        expect do
          post "/lessons", params: { lesson: invalid_lessons_params }
        end.not_to change(Lesson, :count)
      end

      it 'renders the new template' do
        post "/lessons", params: { lesson: invalid_lessons_params }
        expect(response).to render_template(:new)
      end

      it 'sets an unprocessable entity status' do
        post "/lessons", params: { lesson: invalid_lessons_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with valid parameters' do
      let(:valid_params) do
        {
          name: "lesson",
          course_id: 1
        }
      end
      it 'assigns a newly created course to @lesson' do
        post "/lessons", params: { lesson: valid_params }
        expect(assigns(:lesson)).to be_a(Lesson)
      end
    end
  end
end
