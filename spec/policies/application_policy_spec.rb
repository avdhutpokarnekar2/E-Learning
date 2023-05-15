# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationPolicy do # rubocop:disable Metrics/BlockLength
  let(:user) { User.new }
  let(:record) { double('Record') }
  let(:policy) { described_class.new(user, record) }

  describe '#index?' do
    it 'returns false' do
      expect(policy.index?).to be false
    end
  end

  describe '#create?' do
    it 'returns false' do
      expect(policy.create?).to be false
    end
  end

  describe '#new?' do
    it 'delegates to create?' do
      expect(policy).to receive(:create?)
      policy.new?
    end
  end

  describe '#update?' do
    it 'returns false' do
      expect(policy.update?).to be false
    end
  end

  describe '#edit?' do
    it 'delegates to update?' do
      expect(policy).to receive(:update?)
      policy.edit?
    end
  end

  describe '#destroy?' do
    it 'returns false' do
      expect(policy.destroy?).to be false
    end
  end

  describe ApplicationPolicy::Scope do
    let(:scope) { double('Scope') }
    let(:resolved_scope) { double('Resolved Scope') }
    let(:policy_scope) { double('Policy Scope') }
    let(:scope_instance) { described_class.new(user, scope) }

    describe '#resolve' do
      it 'returns the original scope' do
        expect(scope_instance.resolve).to eq(scope)
      end
    end
  end
end
