# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    before do
      Course.create(name: 'Course 1')
      Course.create(name: 'Course 2')
      Course.create(name: 'Course 3')
      @last_course = Course.last
      @first_course = Course.first

      get :index
    end

    it 'assigns @courses' do
      courses = Course.all
      expect(assigns(:courses)).to eq(courses)
    end

    it 'assigns @course' do
      expect(assigns(:course)).to eq(@last_course)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
end
