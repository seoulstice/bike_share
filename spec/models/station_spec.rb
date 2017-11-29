RSpec.describe Station do
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
