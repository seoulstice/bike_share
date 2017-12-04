class CreateTableConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions, :primary_key => 'date' do |t|
      t.decimal :max_temperature_f
      t.decimal :mean_temperature_f
      t.decimal :min_temperature_f
      t.decimal :mean_humidity
      t.decimal :mean_visibility_miles
      t.decimal :mean_wind_speed_mph
      t.decimal :precipitation_inches
    end
  end
end
