RSpec.describe Station do
  describe "Instance Methods" do
    before(:each) do
      Trip.create(duration: 2,
                  start_date: "1-19-2017",
                  start_station: "South SF",
                  start_station_id: 1,
                  end_date: "1-19-2017",
                  end_station: "North SF",
                  end_station_id: 2,
                  bike_id: 21,
                  subscription_type: "Subscriber",
                  zipcode: 12345
                  )

      Trip.create(duration: 6,
                  start_date: "7-4-2017",
                  start_station: "North SF",
                  start_station_id: 2,
                  end_date: "7-4-2017",
                  end_station: "North SF",
                  end_station_id: 2,
                  bike_id: 21,
                  subscription_type: "Subscriber",
                  zipcode: 12345
                  )

      Trip.create(duration: 4,
                  start_date: "7-4-2017",
                  start_station: "North SF",
                  start_station_id: 2,
                  end_date: "7-4-2017",
                  end_station: "North SF",
                  end_station_id: 2,
                  bike_id: 33,
                  subscription_type: "Customer",
                  zipcode: 12345
                  )

      Station.create(name: "South SF", dock_count: 55, city: "San Juniperno", installation_date: "11/21/1992")
      Station.create(name: "North SF", dock_count: 55, city: "San Juniperno", installation_date: "11/21/1992")
      station_1 = Station.find(1)
      station_2 = Station.find(2)
    end

    it '#rides_started' do
      skip
      expect(station_1.rides_started).to eq(1)
    end

    it '#rides_ended' do
      skip
      expect(station_2.rides_ended).to eq(3)
    end

    it '#most_popular_end_station' do
      skip
      expect(station_2.most_popular_end_station.id).to eq(2)
    end

    it '#most_popular_start_station' do
      skip
      expect(station.most_popular_start_station.id).to eq(2)
    end

    it '#date_most_rides_started' do
      skip
      expect(station_2.date_most_rides_started).to eq('7-4-2017')
    end

    it '#most_common_zipcode' do
      skip
      expect(station_2.most_common_zipcode).to eq(12345)
    end

    it '#bike_most_commonly_started_on' do
      skip
      expect(station_1.bike_most_commonly_started_on).to eq(21)
    end
  end

  describe "validations" do
    it "is not valid without a name" do
      station = Station.new(dock_count: 55, city: "San Juniperno", installation_date: "11/21/1992")

      expect(station).to be_invalid
    end

    it "is not valid without a dock_count" do
      station = Station.new(name: "This station", city: "San Juniperno", installation_date: "11/21/1992")

      expect(station).to be_invalid
    end

    it "is not valid without a city" do
      station = Station.new(name: "This station", dock_count: 55, installation_date: "11/21/1992")

      expect(station).to be_invalid
    end

    it "is not valid without an installation_date" do
      station = Station.new(name: "This station", dock_count: 55, city: "San Juniperno")

      expect(station).to be_invalid
    end
  end
end
