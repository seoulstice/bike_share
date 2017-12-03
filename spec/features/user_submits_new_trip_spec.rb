describe "When a visitor submits a new trip" do
  before(:each) do
    Station.create(name: "South SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 30.1023, longitude: -30.1235)
    Station.create(name: "North SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 40.1023, longitude: -30.1235)
  end

  it "is redirected to that trip's page" do
    visit '/trips/new'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-01")
    fill_in('trip[start_station]', with: "Alcatraz")
    fill_in('trip[start_station_id]', with: 1)
    fill_in('trip[end_date]', with: "2017-01-01")
    fill_in('trip[end_station]', with: "SF City Hall")
    fill_in('trip[end_station_id]', with: 2)
    fill_in('trip[bike_id]', with: 2)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="New"]').click

    expect(page).to have_current_path('/trips/1')
  end

  it "new trip is saved" do
    visit '/trips/new'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-01")
    fill_in('trip[start_station]', with: "Alcatraz")
    fill_in('trip[start_station_id]', with: 1)
    fill_in('trip[end_date]', with: "2017-01-01")
    fill_in('trip[end_station]', with: "SF City Hall")
    fill_in('trip[end_station_id]', with: 2)
    fill_in('trip[bike_id]', with: 2)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="New"]').click

    expect(page).to have_content("60")
    expect(page).to have_content("2017-01-01")
    expect(page).to have_content("Alcatraz")
    expect(page).to have_content("SF City Hall")
    expect(page).to have_content(2)
    expect(page).to have_content("Customer")
  end
end
