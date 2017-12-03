RSpec.describe Station do
  describe "Instance Methods" do
    before(:each) do
      Trip.create(duration: 2,
                  start_date: "2017-1-19",
                  start_station: "South SF",
                  start_station_id: 1,
                  end_date: "2017-1-19",
                  end_station: "North SF",
                  end_station_id: 2,
                  bike_id: 21,
                  subscription_type: "Subscriber",
                  zipcode: 12345
                  )

      Trip.create(duration: 6,
                  start_date: "2017-7-4",
                  start_station: "North SF",
                  start_station_id: 2,
                  end_date: "2017-7-4",
                  end_station: "North SF",
                  end_station_id: 2,
                  bike_id: 21,
                  subscription_type: "Subscriber",
                  zipcode: 12345
                  )

      Trip.create(duration: 4,
                  start_date: "2017-7-4",
                  start_station: "North SF",
                  start_station_id: 2,
                  end_date: "2017-7-4",
                  end_station: "North SF",
                  end_station_id: 2,
                  bike_id: 33,
                  subscription_type: "Customer",
                  zipcode: 12345
                  )
      Trip.create(duration: 4,
                  start_date: "2017-7-4",
                  start_station: "North SF",
                  start_station_id: 2,
                  end_date: "2017-7-4",
                  end_station: "North SF",
                  end_station_id: 1,
                  bike_id: 33,
                  subscription_type: "Customer",
                  zipcode: 12345
                  )

      Station.create(name: "South SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 30.1023, longitude: -30.1235)
      Station.create(name: "North SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 40.1023, longitude: -30.1235)
      @station_1 = Station.find(1)
      @station_2 = Station.find(2)
    end

    it '#rides_started' do
      expect(@station_1.rides_started).to eq(1)
    end

    it '#rides_ended' do
      expect(@station_2.rides_ended).to eq(3)
    end

    it '#most_popular_end_station' do
      expect(@station_2.most_popular_end_station.id).to eq(2)
    end

    it '#most_popular_start_station' do
      expect(@station_1.most_popular_start_station.id).to eq(2)
    end

    it '#date_most_rides_started' do
      expect(@station_2.date_most_rides_started).to eq(Date.strptime('2017-7-4', '%Y-%m-%e'))
    end

    it '#most_common_zipcode' do
      expect(@station_2.most_common_zipcode).to eq(12345)
    end

    it '#bike_most_commonly_started_on' do
      expect(@station_1.bike_most_commonly_started_on).to eq(21)
    end

    describe "Class Methods" do
      it ".view_order" do

      end

      it ".city_groups" do

      end

      it ".average_dock_count" do

      end

      it ".maximum_dock_count" do

      end

      it ".minimum_dock_count" do

      end

      it ".max_dock_count_station" do

      end

      it ".min_dock_count_station" do

      end

      it ".newest_station" do

      end

      it "oldest_station" do
        
      end
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
