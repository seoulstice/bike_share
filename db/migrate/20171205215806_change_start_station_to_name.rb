class ChangeStartStationToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :trips, :start_station, :start_station_name
    rename_column :trips, :end_station, :end_station_name
  end
end
