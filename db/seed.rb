require './app/models/station'
require './app/models/trip'
require './app/models/condition'
require 'database_cleaner'
require 'csv'

class Seed
  def self.production
    Seed.stations
    Seed.weather
    Seed.trips_heroku
  end

  def self.test
    DatabaseCleaner.clean
    Seed.stations
    Seed.weather
    Seed.trips_heroku
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

  def self.normal_distribution(count, average, variance)
    Array.new(count) { average + (variance) * Math.sqrt(-2 * Math.log(rand)) * Math.cos(2 * Math::PI * rand) }
  end

  def self.trips_heroku
    subscription_type = ["Customer", "Subscriber"]
    durations = normal_distribution(4000, 60, 3)
    4000.times do |time|
      condition = Condition.all.sample
      start_station = Station.all.sample
      end_station = Station.all.sample
      Trip.create!(duration: durations.pop,
                   start_date: condition.date,
                   start_station_name: start_station.name,
                   start_station_id: start_station.id,
                   end_date: condition.date,
                   end_station_name: end_station.name,
                   end_station_id: end_station.id,
                   bike_id: rand(1..400),
                   subscription_type: subscription_type.sample,
                   zipcode: 54611,
                   condition_id: condition.id
                 )
    end
  end

  def self.trip_fixture
    CSV.foreach('db/csv/trip_fixture.csv', {headers: true, header_converters: :symbol, converters: :numeric}) do |row|
      Trip.create!(duration: row[:duration],
        start_date: Date.strptime(row[:start_date], '%m/%e/%Y'),
        start_station_name: row[:start_station_name],
        start_station_id: row[:start_station_id],
        end_date: Date.strptime(row[:end_date], '%m/%e/%Y'),
        end_station_name: row[:end_station_name],
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
      begin
      Trip.create!(duration: row[:duration],
        start_date: Date.strptime(row[:start_date], '%m/%e/%Y'),
        start_station_name: row[:start_station_name],
        start_station_id: row[:start_station_id],
        end_date: Date.strptime(row[:end_date], '%m/%e/%Y'),
        end_station_name: row[:end_station_name],
        end_station_id: row[:end_station_id],
        bike_id: row[:bike_id],
        subscription_type: row[:subscription_type],
        zipcode: row[:zip_code],
        condition_id: Condition.find_by(date: Date.strptime(row[:start_date], '%m/%e/%Y')).id
      )
    rescue
      puts "Caught Seed Error"
      end
    end
  end

  def self.weather
    CSV.foreach('db/csv/weather.csv', {headers: true, header_converters: :symbol, converters: :numeric}) do |row|
      if row[:zip_code] == 94107
        Condition.create!(date: Date.strptime(row[:date], '%m/%e/%Y'),
                          max_temperature_f: row[:max_temperature_f],
                          mean_temperature_f: row[:mean_temperature_f],
                          min_temperature_f: row[:min_temperature_f],
                          mean_humidity: row[:mean_humidity],
                          mean_visibility_miles: row[:mean_visibility_miles],
                          mean_wind_speed_mph: row[:mean_wind_speed_mph],
                          precipitation_inches: row[:precipitation_inches].to_f
                          )
      end
    end
  end
end
