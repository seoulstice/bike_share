require './app/models/station'
require './app/models/trip'
require 'csv'

class Seed
  def self.test
    Seed.stations
    Seed.trip_fixture
  end

  def self.stations
    CSV.foreach('db/csv/station.csv', {headers: true, header_converters: :symbol, converters: :numeric}) do |row|
      Station.create!(id:                row[:id],
        name:              row[:name],
        city:              row[:city],
        dock_count:        row[:dock_count],
        installation_date: Date.strptime(row[:installation_date], '%m/%e/%Y'),
        latitude:          row[:lat],
        longitude:         row[:long]
      )
    end
  end

  def self.trip_fixture
    CSV.foreach('db/csv/trip_fixture.csv', {headers: true, header_converters: :symbol, converters: :numeric}) do |row|
      Trip.create!(duration: row[:duration],
        start_date: Date.strptime(row[:start_date], '%m/%e/%Y'),
        start_station: row[:start_station_name],
        start_station_id: row[:start_station_id],
        end_date: Date.strptime(row[:end_date], '%m/%e/%Y'),
        end_station: row[:end_station_name],
        end_station_id: row[:end_station_id],
        bike_id: row[:bike_id],
        subscription_type: row[:subscription_type],
        zipcode: row[:zip_code]
      )
    end
  end

  def self.trips
    CSV.foreach('db/csv/trip.csv', {headers: true, header_converters: :symbol, converters: :numeric}) do |row|
      Trip.create!(duration: row[:duration],
        start_date: Date.strptime(row[:start_date], '%m/%e/%Y'),
        start_station: row[:start_station_name],
        start_station_id: row[:start_station_id],
        end_date: Date.strptime(row[:end_date], '%m/%e/%Y'),
        end_station: row[:end_station_name],
        end_station_id: row[:end_station_id],
        bike_id: row[:bike_id],
        subscription_type: row[:subscription_type],
        zipcode: row[:zip_code]
      )
    end
  end
end
