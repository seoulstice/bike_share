RSpec.describe Station do
  describe "Instance Methods" do
    it '#rides_started' do
      expect(Station.all.first.rides_started).to eq(8)
    end

    it '#rides_ended' do
      expect(Station.all.first.rides_ended).to eq(9)
    end

    it '#most_popular_end_station' do
      expect(Station.all.first.most_popular_end_station.id).to eq(10)
    end

    it '#most_popular_start_station' do
      expect(Station.all.first.most_popular_start_station.id).to eq(4)
    end

    it '#date_most_rides_started' do
      expect(Station.all.first.date_most_rides_started).to eq(Date.strptime('2013-8-29', '%Y-%m-%e'))
    end

    it '#most_common_zipcode' do
      expect(Station.all.first.most_common_zipcode).to eq(95126)
    end

    it '#bike_most_commonly_started_on' do
      expect(Station.all.first.bike_most_commonly_started_on).to eq(91)
    end
  end

  describe "Class Methods" do
    it ".view_order" do
      expect(Station.view_order.first.city).to eq("Mountain View")
    end

    it ".view_order" do
      expect(Station.view_order.first.name).to eq("Castro Street and El Camino Real")
    end

    it ".city_groups" do
      expected = {"Mountain View"=>7, "San Jose"=>16, "San Francisco"=>35, "Palo Alto"=>5, "Redwood City"=>7}

      expect(Station.city_groups.count).to eq(expected)
    end

    it ".average_dock_count" do
      expect(Station.average_dock_count).to eq(17.66)
    end

    it ".maximum_dock_count" do
      expect(Station.maximum_dock_count).to eq(27)
    end

    it ".mininum_dock_count" do
      expect(Station.mininum_dock_count).to eq(11)
    end

    it ".max_dock_count_station" do
      expect(Station.max_dock_count_station.name).to eq("San Jose Diridon Caltrain Station")
    end

    it ".min_dock_count_station" do
      expect(Station.min_dock_count_station.name).to eq("Santa Clara at Almaden")
    end

    it ".newest_station" do
      expect(Station.newest_station.name).to eq("San Jose Civic Center")
    end

    it ".oldest_station" do
      expect(Station.oldest_station.name).to eq("Ryland Park")
    end
  end

  describe "validations" do
    it "is not valid without a name" do
      station = Station.new(dock_count: 55, city: "San Juniperno", installation_date: "1992-1-19", latitude: 30.1023, longitude: -30.1235)

      expect(station).to be_invalid
    end

    it "is not valid without a dock_count" do
      station = Station.new(name: "This station", city: "San Juniperno", installation_date: "1992-1-19", latitude: 30.1023, longitude: -30.1235)

      expect(station).to be_invalid
    end

    it "is not valid without a city" do
      station = Station.new(name: "This station", dock_count: 55, installation_date: "1992-1-19", latitude: 30.1023, longitude: -30.1235)

      expect(station).to be_invalid
    end

    it "is not valid without an installation_date" do
      station = Station.new(name: "This station", dock_count: 55, city: "San Juniperno", latitude: 30.1023, longitude: -30.1235)

      expect(station).to be_invalid
    end

    it "is not valid without a latitude" do
      station = Station.new(name: "This station", dock_count: 55, city: "San Juniperno", installation_date: "1992-1-19", longitude: -30.1235)

      expect(station).to be_invalid
    end

    it "is not valid without a longitude" do
      station = Station.new(name: "This station", dock_count: 55, city: "San Juniperno", installation_date: "1992-1-19", latitude: 30.1023)

      expect(station).to be_invalid
    end
  end
end
