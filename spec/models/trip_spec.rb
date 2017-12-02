describe Trip do
  describe "Class methods" do
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
    end

    it ".average_duration" do
      skip
      expect(Trip.average_duration).to eq(4)
    end

    it ".longest_ride" do
      skip
      expect(Trip.longest_ride).to eq(6)
    end

    it ".shortest_ride" do
      skip
      expect(Trip.shortest_ride).to eq(2)
    end

    it ".station_most_start_rides" do
      skip
      expect(Trip.station_most_start_rides.id).to eq(2)
    end

    it ".station_most_end_rides" do
      skip
      expect(Trip.station_most_end_rides.id).to eq(2)
    end

    it ".rides_by_month" do
      skip
      expected = {1  => 1, 7  => 2}

      expect(Trip.rides_by_month).to eq(expected)
    end

    it ".rides_by_month_and_year" do
      skip
      expected = {2017 => {1  => 1, 7  => 2}}

      expect(Trip.rides_by_month_and_year).to eq(expected)
    end

    it ".most_ridden_bike" do
      skip
      expect(Trip.most_ridden_bike).to eq(21)
    end

    it ".least_ridden_bike" do
      skip
      expect(Trip.least_ridden_bike).to eq(33)
    end

    it ".count_by_subscription_type" do
      skip
      #Build a hash of a count of each (accumulate)
      result = {"Subscriber" => 2, "Customer" => 1}

      expect(Trip.count_by_subscription_type).to eq(result)
    end

    it ".date_with_most_rides" do
      skip
      expect(Trip.date_with_most_rides).to eq("7-4-2017")
    end

    it ".date_with_least_rides" do
      skip
      expect(Trip.date_with_least_rides).to eq("1-19-2017")
    end
  end

  describe "validations" do
    it "is not valid without a duration" do
      trip = Trip.new(start_date: "2017-01-01",
                      start_station: "South SF",
                      end_date: "2017-01-01",
                      end_station: "North SF",
                      bike_id: 21,
                      subscription_type: "Subscriber",
                      zipcode: 12345
                     )

      expect(trip).to_not be_valid
    end

    it "is not valid without a start date" do
      trip = Trip.new(duration: 2,
                      start_station: "South SF",
                      end_date: "2017-01-01",
                      end_station: "North SF",
                      bike_id: 21,
                      subscription_type: "Subscriber"
                      )

      expect(trip).to_not be_valid
    end

    it "is not valid without a start_station" do
      trip = Trip.new(duration: 2,
                      start_date: "2017-01-01",
                      end_date: "2017-01-01",
                      end_station: "North SF",
                      bike_id: 21,
                      subscription_type: "Subscriber"
                     )

      expect(trip).to_not be_valid
    end

    it "is not valid without an end_date" do
      trip = Trip.new(duration: 2,
                      start_date: "2017-01-01",
                      start_station: "South SF",
                      end_station: "North SF",
                      bike_id: 21,
                      subscription_type: "Subscriber",
                      zipcode: 12345
                     )

      expect(trip).to_not be_valid
    end

    it "is not valid without an end station" do
      trip = Trip.new(duration: 2,
                      start_date: "2017-01-01",
                      start_station: "South SF",
                      end_date: "2017-01-01",
                      bike_id: 21,
                      subscription_type: "Subscriber",
                      zipcode: 12345
                     )

      expect(trip).to_not be_valid
    end

    it "is not valid without a bike id" do
      trip = Trip.new(duration: 2,
                      start_date: "2017-01-01",
                      start_station: "South SF",
                      end_date: "2017-01-01",
                      end_station: "North SF",
                      subscription_type: "Subscriber",
                      zipcode: 12345
                     )

      expect(trip).to_not be_valid
    end

    it "is not valid without a subscription type" do
      trip = Trip.new(duration: 2,
                      start_date: "2017-01-01",
                      start_station: "South SF",
                      end_date: "2017-01-01",
                      end_station: "North SF",
                      bike_id: 21,
                      zipcode: 12345
                     )

      expect(trip).to_not be_valid
    end

    it "is valid without a zipcode" do
      trip = Trip.new(duration: 2,
                      start_date: "2017-01-01",
                      start_station: "South SF",
                      end_date: "2017-01-01",
                      end_station: "North SF",
                      bike_id: 21,
                      subscription_type: "Subscriber"
                     )

      expect(trip).to be_valid
    end
  end
end
