require 'csv'
require './app/models/station'

CSV.foreach('db/csv/station.csv', {headers: true, header_converters: :symbol}) do |row|
  Station.create(name:              row[:name],
                 city:              row[:city],
                 dock_count:        row[:dock_count],
                 installation_date: row[:installation_date])
end
