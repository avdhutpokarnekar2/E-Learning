# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do # rubocop:disable Metrics/BlockLength
  describe 'validation' do
    let(:course) do
      Course.new(name: 'python', description: 'it is description', fees: 200, course_type: 'classroom', duration: 3,
                 start_date: 12 - 2 - 2022)
    end

    it 'name should present' do
      course.name = nil
      expect(course).not_to be_valid
    end

    it 'description should present' do
      course.description = nil
      expect(course).not_to be_valid
    end

    it 'fees should present' do
      course.fees = nil
      expect(course).not_to be_valid
    end

    it 'duration should present' do
      course.duration = nil
      expect(course).not_to be_valid
    end

    it 'fees should be valid' do
      course.fees = 123
      expect(course).to be_valid
    end
  end
end
