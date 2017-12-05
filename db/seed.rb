require './app/models/station'
require './app/models/trip'
require './app/models/condition'
require 'csv'

class Seed
  def self.production
    Seed.stations
    Seed.weather
    Seed.trip
  end

  def self.test
    Seed.stations
    Seed.trip_fixture
    Seed.weather
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
    ActiveRecord::Base.connection.reset_pk_sequence!('stations')
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
        zipcode: row[:zip_code],
        condition_id: Condition.find_by(date: Date.strptime(row[:start_date], '%m/%e/%Y')).id
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
        zipcode: row[:zip_code],
        condition_id: Condition.find_by(date: Date.strptime(row[:start_date], '%m/%e/%Y')).id
      )

    end
  end

  def self.weather
    CSV.foreach('db/csv/weather.csv', {headers: true, header_converters: :symbol, converters: :numeric}) do |row|
      Condition.create!(date: Date.strptime(row[:date], '%m/%e/%Y'),
                        max_temperature_f: row[:max_temperature_f],
                        min_temperature_f: row[:min_temperature_f],
                        mean_temperature_f: row[:mean_temperature_f],
                        mean_humidity: row[:mean_humidity],
                        mean_visibility_miles: row[:mean_visibility_miles],
                        mean_wind_speed_mph: row[:mean_wind_speed_mph],
                        precipitation_inches: row[:precipitation_inches]
                      )
    end
  end
end
