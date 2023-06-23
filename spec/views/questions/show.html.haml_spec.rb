# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'questions/show', type: :view do
  before(:each) do
    assign(:question, Question.create!(
                        title: 'Title',
                        answer: 'Answer',
                        option: '',
                        assignment: nil
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Answer/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
