# spec/models/lesson_spec.rb
require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe "attachments and presence" do
    let(:user) do
      Lesson.new(name: "lesson_name")
    end
    it "has a video attachment" do
      lesson = Lesson.new(name: "Sample Lesson")
      expect(lesson.video).to be_an_instance_of(ActiveStorage::Attached::One)
    end

    it "name should be present" do
      lesson = Lesson.new(name: "lesson_name")
      lesson.name = nil
      expect(lesson).not_to be_valid
    end
  end

end
