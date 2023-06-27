# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assessments/new', type: :view do
  before(:each) do
    assign(:assessment, Assessment.new(
                          question_set: '',
                          grade: 'MyString',
                          assignment: nil,
                          user: nil
                        ))
  end

  it 'renders new assessment form' do
    render

    assert_select 'form[action=?][method=?]', assessments_path, 'post' do
      assert_select 'input[name=?]', 'assessment[question_set]'

      assert_select 'input[name=?]', 'assessment[grade]'

      assert_select 'input[name=?]', 'assessment[assignment_id]'

      assert_select 'input[name=?]', 'assessment[user_id]'
    end
  end
end
