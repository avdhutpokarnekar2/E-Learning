# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'assignments/show', type: :view do
  before(:each) do
    assign(:assignment, Assignment.create!(
                          name: 'Name',
                          course: nil
                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
