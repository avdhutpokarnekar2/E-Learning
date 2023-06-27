# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assessments/index', type: :view do
  before(:each) do
    assign(:assessments, [
             Assessment.create!(
               question_set: '',
               grade: 'Grade',
               assignment: nil,
               user: nil
             ),
             Assessment.create!(
               question_set: '',
               grade: 'Grade',
               assignment: nil,
               user: nil
             )
           ])
  end

  it 'renders a list of assessments' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Grade'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
