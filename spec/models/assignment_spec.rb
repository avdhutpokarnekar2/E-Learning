# spec/models/assignment_spec.rb
require 'rails_helper'

RSpec.describe Assignment, type: :model do
  describe "structure" do
    it "name should be present" do
      assignment = Assignment.new(name: "name")
      assignment.name = nil
      expect(assignment).not_to be_valid
    end
  
    it "has a name column of type string" do
      expect(Assignment.column_for_attribute(:name).type).to eq(:string)
    end
    it "has a course_id column of type bigint" do
      expect(Assignment.column_for_attribute(:course_id).type).to eq(:integer)
    end
  end
end
