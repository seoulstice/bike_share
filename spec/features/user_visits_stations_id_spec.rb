describe "When a visitor visits individual station" do
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
    Station.create(name: "Mid SF", dock_count: 25, city: "San Juniperno", installation_date: "1992-11-25", latitude: 35.1023, longitude: -30.1235)
  end

  it "sees the correct station with an Edit link" do
    visit '/stations/1'

    expect(page).to have_current_path('/stations/1')

    expect(page).to have_content("South SF")
    expect(page).to have_content("SF")
    expect(page).to have_content("12")
    expect(page).to have_content("2017-01-19")
    expect(page).to have_link('Edit')
    expect(page).to have_selector('input[name="Delete"]')
  end

  it "clicks on Edit link" do
    visit '/stations/1'

    click_link('Edit')

    expect(page).to have_current_path('/stations/1/edit')
  end

  it "sees banner" do
    visit '/stations/1'

    expect(page).to have_current_path('/stations/1')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "clicks on the Home breadcrumb" do
    visit '/stations/1'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Stations breadcrumb" do
    visit '/stations/1'

    click_link("Stations")

    expect(page).to have_current_path('/stations')
  end
end
