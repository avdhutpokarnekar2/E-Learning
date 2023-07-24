# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:user) { create (:user)}
  let(:course) { create(:course, user_id: user.id) }
  let(:assignment) { create(:assignment, course_id: course.id) }
  let (:question) do
   Question.new( 
    title: "Example Name",
    answer: "a", option: {"a" => ".pi", "b" => ".python", "c" => ".py", "d" => ".p"},
    assignment_id: assignment.id
    )
  end
  describe 'validation' do
    it "should have a name" do
      expect(question).to be_valid
    end
  end

  describe 'invalid' do
    it 'name should be present' do
      question = Question.new(title: nil)
      question.title = nil
      expect(question).not_to be_valid
    end

    it 'question_no should present' do
      question = Question.new(option: nil)
      question.option = nil
      expect(question).not_to be_valid
    end

    it 'question_no should present' do
      question = Question.new(answer: nil)
      question.option = nil
      expect(question).not_to be_valid
    end
  end
end