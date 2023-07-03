# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validation' do
    let(:question) do
      Question.new(title: "its questio", answer: "a", option: {"a"=>".pi", "b"=>".python", "c"=>".py", "d"=>".p"}, assignment_id: assignment.id)
    end

    it 'name should present' do
      question.title = nil
      expect(question).not_to be_valid
    end

    it 'email should present' do
      question.answer = nil
      expect(question).not_to be_valid
    end

    it 'question_no should present' do
      question.option = nil
      expect(question).not_to be_valid
    end

    it 'valid name' do
      question.title = 'it is question for spec'
      expect(question).to be_valid
    end
  end
end
