describe "When a visistor visits individual trip" do
  before(:each) do
    @trip = Trip.create(duration: 2,
                    start_date: "2017-01-01",
                    start_station: "South SF",
                    start_station_id: 1,
                    end_date: "2017-01-03",
                    end_station: "North SF",
                    end_station_id: 2,
                    bike_id: 33,
                    subscription_type: "Subscriber",
                    zipcode: 12345
                   )
    Station.create(name: "South SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 30.1023, longitude: -30.1235)
    Station.create(name: "North SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 40.1023, longitude: -30.1235)
  end

  it "sees the correct trip with an Edit link" do
    visit '/trips/1'

    expect(page).to have_current_path('/trips/1')

    expect(page).to have_content("Trip 1")
    expect(page).to have_content("Duration: 2")
    expect(page).to have_content("Start Date: 2017-01-01")
    expect(page).to have_content("Start Station: South SF")
    expect(page).to have_content("End Date: 2017-01-03")
    expect(page).to have_content("End Station: North SF")
    expect(page).to have_content("Bike ID: 33")
    expect(page).to have_content("Zip Code: 12345")
  end

  it "sees banner" do
    visit '/trips/1'

    expect(page).to have_current_path('/trips/1')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end
end
