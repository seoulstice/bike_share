describe "When a visitor submits a new station" do
  before(:each) do
    Trip.create(duration: 6, start_date: "2017-1-1", start_station: "North SF", start_station_id: 85, end_date: "2017-1-1", end_station: "North SF", end_station_id: 85, bike_id: 1, subscription_type: "customer")
    Trip.create(duration: 6, start_date: "2017-1-1", start_station: "North SF", start_station_id: 86, end_date: "2017-1-1", end_station: "North SF", end_station_id: 86, bike_id: 1, subscription_type: "customer")
  end

  it "new station is saved" do
    visit '/stations/new'
    fill_in('station[name]', with: "North SF")
    fill_in('station[city]', with: "SF")
    fill_in('station[dock_count]', with: 2)
    fill_in('station[installation_date]', with: "2017-01-01")
    fill_in('station[latitude]', with: 40.1023)
    fill_in('station[longitude]', with: -30.1235)

    find('input[name="New"]').click

    expect(page).to have_content("North SF")
    expect(page).to have_content("SF")
    expect(page).to have_content(2)
    expect(page).to have_content("2017-01-01")
  end


  it "is redirected to that station's page" do
    visit '/stations/new'
    fill_in('station[name]', with: "North SF")
    fill_in('station[city]', with: "SF")
    fill_in('station[dock_count]', with: 2)
    fill_in('station[installation_date]', with: "2017-01-01")
    fill_in('station[latitude]', with: 40.1023)
    fill_in('station[longitude]', with: -30.1235)
    find('input[name="New"]').click


    expect(page).to have_current_path("/stations/86")
  end
end