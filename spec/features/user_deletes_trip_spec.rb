describe "When a user deletes a trip" do
  before(:each) do
    @trip_1 = Trip.create(id: 450, duration: 188, start_date: "2013-08-29", start_station: "Post at Kearney", start_station_id: 1, end_date: "2013-08-30", end_station: "5th at Howard", end_station_id: 2, bike_id: 673, subscription_type: "Subscriber", zipcode: 90210)
    Station.create(name: "South SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 30.1023, longitude: -30.1235)
    Station.create(name: "North SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 40.1023, longitude: -30.1235)
  end

  it "the trip is deleted" do
    visit '/trips/450'
    find('input[name="Delete"]').click

    expect(page).to_not have_content(450)
    expect(page).to_not have_content(188)
    expect(page).to_not have_content("2013-08-29")
    expect(page).to_not have_content("Post at Kearney")
    expect(page).to_not have_content("2013-08-30")
    expect(page).to_not have_content("5th at Howard")
    expect(page).to_not have_content(673)
    expect(page).to_not have_content("Subscriber")
    expect(page).to_not have_content(90210)
  end

  it "after trip is deleted user is on trips page" do
    visit '/trips/450'
    find('input[name="Delete"]').click

    expect(page).to have_current_path("/trips")
  end
end
