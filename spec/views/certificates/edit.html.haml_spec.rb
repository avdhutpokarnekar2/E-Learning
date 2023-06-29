require 'rails_helper'

RSpec.describe "certificates/edit", type: :view do
  let(:certificate) {
    Certificate.create!(
      grade: "MyString",
      user: nil,
      course: nil
    )
  }

  before(:each) do
    assign(:certificate, certificate)
  end

  it "renders the edit certificate form" do
    render

    assert_select "form[action=?][method=?]", certificate_path(certificate), "post" do

      assert_select "input[name=?]", "certificate[grade]"

      assert_select "input[name=?]", "certificate[user_id]"

      assert_select "input[name=?]", "certificate[course_id]"
    end
  end
end
