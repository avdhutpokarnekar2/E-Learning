require 'rails_helper'

RSpec.describe "certificates/new", type: :view do
  before(:each) do
    assign(:certificate, Certificate.new(
      grade: "MyString",
      user: nil,
      course: nil
    ))
  end

  it "renders new certificate form" do
    render

    assert_select "form[action=?][method=?]", certificates_path, "post" do

      assert_select "input[name=?]", "certificate[grade]"

      assert_select "input[name=?]", "certificate[user_id]"

      assert_select "input[name=?]", "certificate[course_id]"
    end
  end
end
