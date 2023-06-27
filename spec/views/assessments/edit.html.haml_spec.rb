# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assessments/edit', type: :view do
  let(:assessment) do
    Assessment.create!(
      question_set: '',
      grade: 'MyString',
      assignment: nil,
      user: nil
    )
  end

  before(:each) do
    assign(:assessment, assessment)
  end

  it 'renders the edit assessment form' do
    render

    assert_select 'form[action=?][method=?]', assessment_path(assessment), 'post' do
      assert_select 'input[name=?]', 'assessment[question_set]'

      assert_select 'input[name=?]', 'assessment[grade]'

      assert_select 'input[name=?]', 'assessment[assignment_id]'

      assert_select 'input[name=?]', 'assessment[user_id]'
    end
  end
end
