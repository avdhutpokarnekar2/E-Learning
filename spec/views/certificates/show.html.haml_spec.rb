require 'rails_helper'

RSpec.describe "certificates/show", type: :view do
  before(:each) do
    assign(:certificate, Certificate.create!(
      grade: "Grade",
      user: nil,
      course: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Grade/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
