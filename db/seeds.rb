require 'csv'
require './app/models/station'
require './app/models/trip'

Station.destroy_all
Trip.destroy_all

#seed station
CSV.foreach('db/csv/station.csv', {headers: true, header_converters: :symbol, converters: :numeric}) do |row|
  Station.create!(name:             row[:name],
                 city:              row[:city],
                 dock_count:        row[:dock_count],
                 installation_date: Date.strptime(row[:installation_date], '%m/%e/%Y')
               )
end

#seed trip
CSV.foreach('db/csv/trip_fixture.csv', {headers: true, header_converters: :symbol,converters: :numeric}) do |row|
  trip = Trip.create!(duration: row[:duration],
               start_date: Date.strptime(row[:start_date], '%m/%e/%Y'),
               start_station: row[:start_station_name],
               end_date: Date.strptime(row[:end_date], '%m/%e/%Y'),
               end_station: row[:end_station_name],
               bike_id: row[:bike_id],
               subscription_type: row[:subscription_type],
               zipcode: row[:zip_code]
              )
end
