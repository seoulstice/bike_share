class CreateTrip < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.date    :start_date
      t.string  :start_station
      t.date    :end_date
      t.string  :end_station
      t.integer :bike_id
      t.string  :subscription_type
      t.integer :zipcode
    end
  end
end
