# spec/models/enrollment_spec.rb
require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  describe "structure" do
    it "has a user_id column" do
      expect(Enrollment.column_for_attribute(:user_id).null).to be(false)
    end

    it "has a course_id column" do
      expect(Enrollment.column_for_attribute(:course_id).null).to be(false)
    end
  end
end
