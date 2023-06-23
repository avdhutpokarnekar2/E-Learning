# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'questions/edit', type: :view do
  let(:question) do
    Question.create!(
      title: 'MyString',
      answer: 'MyString',
      option: '',
      assignment: nil
    )
  end

  before(:each) do
    assign(:question, question)
  end

  it 'renders the edit question form' do
    render

    assert_select 'form[action=?][method=?]', question_path(question), 'post' do
      assert_select 'input[name=?]', 'question[title]'

      assert_select 'input[name=?]', 'question[answer]'

      assert_select 'input[name=?]', 'question[option]'

      assert_select 'input[name=?]', 'question[assignment_id]'
    end
  end
end
