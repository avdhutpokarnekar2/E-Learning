# spec/models/assessment_spec.rb
require 'rails_helper'

RSpec.describe Assessment, type: :model do
  describe "structure" do
    it "question_set column of type jsonb" do
      expect(Assessment.column_for_attribute(:question_set).type).to eq(:jsonb)
    end
    it "assignment_id column of type integer" do
      expect(Assessment.column_for_attribute(:assignment_id).type).to eq(:integer)
    end
    it "user_id column of type integer" do
      expect(Assessment.column_for_attribute(:user_id).type).to eq(:integer)
    end
  end
end
