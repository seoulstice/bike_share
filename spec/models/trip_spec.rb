describe Trip do
  describe "Class methods" do
    it ".average_duration" do
      expect(Trip.average_duration).to eq(1261.61)
    end

    it ".longest_ride" do
      expect(Trip.longest_ride).to eq(97713)
    end

    it ".shortest_ride" do
      expect(Trip.shortest_ride).to eq(63)
    end

    it ".station_most_start_rides" do
      expect(Trip.station_most_start_rides).to eq("South Van Ness at Market")
    end

    it ".station_most_end_rides" do
      expect(Trip.station_most_end_rides).to eq("South Van Ness at Market")
    end

    it ".rides_by_month" do
      rides_by_month = Trip.rides_by_month

      expect(rides_by_month.first.first.month).to eq(8)
      expect(rides_by_month.first.last).to eq(1000)
    end

    it ".rides_by_year" do
      rides_by_year = Trip.rides_by_year

      expect(rides_by_year.first.first.year).to eq(2013)
      expect(rides_by_year.first.last).to eq(1000)
    end


    it ".most_ridden_bike" do
      expect(Trip.most_ridden_bike).to eq(538)
    end

    it ".least_ridden_bike" do
      expect(Trip.least_ridden_bike).to eq(11)
    end

    it ".most_ridden_bike_ride_count" do
      expect(Trip.most_ridden_bike_ride_count).to eq(14)
    end

    it ".least_ridden_bike_ride_count" do
      expect(Trip.least_ridden_bike_ride_count).to eq(1)
    end

    it ".subscription_groups" do
      result = {"Customer"=>385, "Subscriber"=>615}

      expect(Trip.subscription_groups.count).to eq(result)
    end

    it ".date_with_most_rides" do
      expect(Trip.date_with_most_rides).to eq(Date.strptime("2013-8-29", '%Y-%m-%e'))
    end

    it ".date_with_most_rides_trip_count" do
      expect(Trip.date_with_most_rides_trip_count).to eq(748)
    end

    it ".date_with_least_rides" do
      expect(Trip.date_with_least_rides).to eq(Date.strptime("2013-8-30", '%Y-%m-%e'))
    end

    it ".date_with_least_rides_trip_count" do
      expect(Trip.date_with_least_rides_trip_count).to eq(252)
    end

    it '.max_occurrence(column)' do
      expect(Trip.max_occurrence(:bike_id)).to eq(538)
    end

    it '.min_occurrence(column)' do
      expect(Trip.min_occurrence(:bike_id)).to eq(11)
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
