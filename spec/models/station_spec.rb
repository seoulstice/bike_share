RSpec.describe Station do
  describe "Instance Methods" do
    it '#rides_started' do
      expect(station.rides_started).to eq(999)
    end

    it '#rides_ended' do
      expect(station.rides_ended).to eq(999)
    end

    it '#most_popular_end_station' do
      expect(station.most_popular_end_station.id).to eq(1)
    end

    it '#most_popular_start_station' do
      expect(station.most_popular_start_station.id).to eq(2)
    end

    it '#most_rides_started' do
      expect(station.most_rides_started).to eq('7-4-2017')
    end

    it '#most_common_zipcode' do
      expect(station.most_common_zipcode).to eq(12345)
    end

    it '#bike_most_commonly_started_on' do
      expect(station.bike_most_commonly_started_on).to eq(21)
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
