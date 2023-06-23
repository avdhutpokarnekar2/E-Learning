# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'questions/index', type: :view do
  before(:each) do
    assign(:questions, [
             Question.create!(
               title: 'Title',
               answer: 'Answer',
               option: '',
               assignment: nil
             ),
             Question.create!(
               title: 'Title',
               answer: 'Answer',
               option: '',
               assignment: nil
             )
           ])
  end

  it 'renders a list of questions' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Answer'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
