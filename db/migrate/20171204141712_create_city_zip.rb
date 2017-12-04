class CreateCityZip < ActiveRecord::Migration[5.1]
  def change
    create_table :cities, primary_key: :zipcode do |t|
      t.string :name
    end
  end
end
