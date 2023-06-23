# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assignments/index', type: :view do
  before(:each) do
    assign(:assignments, [
             Assignment.create!(
               name: 'Name',
               course: nil
             ),
             Assignment.create!(
               name: 'Name',
               course: nil
             )
           ])
  end

  it 'renders a list of assignments' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
