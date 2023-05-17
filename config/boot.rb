# frozen_string_literal: true

if ENV['RAILS_ENV'] == 'development'
  require 'simplecov'
  SimpleCov.start 'rails'
  puts "required simplecov"
end

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
