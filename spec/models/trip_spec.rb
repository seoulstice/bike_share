describe Trip do
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
