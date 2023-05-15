# frozen_string_literal: true

require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe Contact, type: :model do
  describe 'validation' do
    let(:contact) do
      Contact.new(name: 'Avdhut', email: 'avdhut@gmail.com', contact_no: '6234567200', message: 'it is a message')
    end

    it 'name should present' do
      contact.name = nil
      expect(contact).not_to be_valid
    end

    it 'email should present' do
      contact.email = nil
      expect(contact).not_to be_valid
    end

    it 'contact_no should present' do
      contact.contact_no = nil
      expect(contact).not_to be_valid
    end

    it 'message should present' do
      contact.message = nil
      expect(contact).not_to be_valid
    end

    it 'valid name' do
      contact.name = 'Avdhut'
      expect(contact).to be_valid
    end
  end
end
