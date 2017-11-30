require 'csv'
require './app/models/station'

  CSV.foreach('db/csv/station.csv', {headers: true, header_converters: :symbol, converters: :numeric}) do |row|
    Station.create!(name:             row[:name],
                   city:              row[:city],
                   dock_count:        row[:dock_count],
                   installation_date: Date.strptime(row[:installation_date], '%m/%e/%Y'))
  end
