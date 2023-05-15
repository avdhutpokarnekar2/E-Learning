# frozen_string_literal: true

# contact model
class Contact < ApplicationRecord
  validates :name, :message, :contact_no, :email, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }, presence: true
end
