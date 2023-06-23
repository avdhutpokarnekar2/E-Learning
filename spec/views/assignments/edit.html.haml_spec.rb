# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assignments/edit', type: :view do
  let(:assignment) do
    Assignment.create!(
      name: 'MyString',
      course: nil
    )
  end

  before(:each) do
    assign(:assignment, assignment)
  end

  it 'renders the edit assignment form' do
    render

    assert_select 'form[action=?][method=?]', assignment_path(assignment), 'post' do
      assert_select 'input[name=?]', 'assignment[name]'

      assert_select 'input[name=?]', 'assignment[course_id]'
    end
  end
end
