require 'database_cleaner'
require_relative 'seed'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

Seed.stations
Seed.trip_fixture
