# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assignments/new', type: :view do
  before(:each) do
    assign(:assignment, Assignment.new(
                          name: 'MyString',
                          course: nil
                        ))
  end

  it 'renders new assignment form' do
    render

    assert_select 'form[action=?][method=?]', assignments_path, 'post' do
      assert_select 'input[name=?]', 'assignment[name]'

      assert_select 'input[name=?]', 'assignment[course_id]'
    end
  end
end
