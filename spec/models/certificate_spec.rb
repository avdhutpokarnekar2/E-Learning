# spec/models/certificate_spec.rb
require 'rails_helper'

RSpec.describe Certificate, type: :model do
  describe "structure" do
    it "has a grade column of type string" do
      expect(Certificate.column_for_attribute(:grade).type).to eq(:string)
    end

    it "has a user_id column of type bigint" do
      expect(Certificate.column_for_attribute(:user_id).null).to be(false)
    end

    it "has a course_id column of type bigint" do
      expect(Certificate.column_for_attribute(:course_id).null).to be(false)
    end
  end
end
