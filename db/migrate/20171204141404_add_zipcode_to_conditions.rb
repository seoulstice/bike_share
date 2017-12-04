class AddZipcodeToConditions < ActiveRecord::Migration[5.1]
  def change
    add_column :conditions, :zipcode, :integer
  end
end
