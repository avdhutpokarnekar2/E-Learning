# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assessments/show', type: :view do
  before(:each) do
    assign(:assessment, Assessment.create!(
                          question_set: '',
                          grade: 'Grade',
                          assignment: nil,
                          user: nil
                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Grade/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
