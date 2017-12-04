ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'
require_relative '../db/seeds'

Capybara.app = BikeShareApp
Capybara.save_path = "tmp/capybara"

DatabaseCleaner.strategy = :truncation


RSpec.configure do |c|
  c.include Capybara::DSL

  c.before(:all) do
    DatabaseCleaner.clean
    Seed.test
  end
end
