# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursePolicy, type: :policy do # rubocop:disable Metrics/BlockLength
  subject { described_class }

  let(:instructor) { User.new(role: 'instructor') }
  let(:student) { User.new(role: 'student') }

  context 'when user is an instructor' do
    it 'grants access' do
      expect(subject.new(instructor, nil).create?).to be true
    end
  end

  context 'when user is not an instructor' do
    it 'denies access' do
      expect(subject.new(student, nil).create?).to be false
    end
  end

  context 'when user is an instructor' do
    it 'grants access' do
      expect(subject.new(instructor, nil).index?).to be true
    end
  end

  context 'when user is not an instructor' do
    it 'denies access' do
      expect(subject.new(student, nil).index?).to be false
    end
  end

  context 'when user is an instructor' do
    it 'grants access' do
      expect(subject.new(instructor, nil).update?).to be true
    end
  end

  context 'when user is not an instructor' do
    it 'denies access' do
      expect(subject.new(student, nil).update?).to be false
    end
  end

  context 'when user is an instructor' do
    it 'grants access' do
      expect(subject.new(instructor, nil).destroy?).to be true
    end
  end

  context 'when user is not an instructor' do
    it 'denies access' do
      expect(subject.new(student, nil).destroy?).to be false
    end
  end
end
