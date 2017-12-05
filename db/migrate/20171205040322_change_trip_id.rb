class ChangeTripId < ActiveRecord::Migration[5.1]
  def change
    change_column :trips, :id, :integer, limit: 8
  end
end
