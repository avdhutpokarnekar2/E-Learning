# frozen_string_literal: true

require 'simplecov'
require 'simplecov-rcov'

SimpleCov.start 'rails' do
  formatter SimpleCov::Formatter::RcovFormatter
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/test/'
  add_filter 'app/channels/'
  add_filter 'app/controllers/users/'
  add_filter 'app/jobs/'
  add_filter 'app/mailers/'
end
