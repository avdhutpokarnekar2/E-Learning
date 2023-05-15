# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do # rubocop:disable Metrics/BlockLength
  describe 'authentication process' do # rubocop:disable Metrics/BlockLength
    let(:user) do
      User.new(email: 'testuser@gmail.com', password: 'Password123!', first_name: 'avdhut', last_name: 'pokarnekar',
               mobile_no: 1_234_567_890, role: 'student')
    end

    it 'first name should present' do
      user.first_name = nil
      expect(user).not_to be_valid
    end

    it 'last_name should present' do
      user.last_name = nil
      expect(user).not_to be_valid
    end

    it 'mobile_no should present' do
      user.mobile_no = nil
      expect(user).not_to be_valid
    end

    it 'email should present' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is valid with a properly formatted email' do
      user = User.new(email: 'avdhut@gmail.com')
      expect(user.email).to match(/\A[\w+\-.]+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i)
    end

    it 'is invalid with an improperly formatted email' do
      user = User.new(email: 'avdhut.com')
      expect(user).not_to be_valid
    end

    it 'is invalid with improperly formatted email' do
      user = User.new(email: 'avdhut@gmailcom')
      expect(user).not_to be_valid
    end
  end
end
