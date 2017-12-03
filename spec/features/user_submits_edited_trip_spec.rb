describe "When a user updates an existing station" do
  before(:each) do
    Trip.create(duration: 60, start_date: "2017-01-01", start_station: "Aldograz", end_date: "2017-01-01", end_station: "SD City Hall", bike_id: 2, subscription_type: "Costumer")
    Station.create(name: "South SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 30.1023, longitude: -30.1235)
    Station.create(name: "North SF", dock_count: 55, city: "San Juniperno", installation_date: "1992-11-21", latitude: 40.1023, longitude: -30.1235)
  end

  it "the submit button redirects to trip show page" do
    visit '/trips/1/edit'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-01")
    fill_in('trip[start_station]', with: "Alcatraz")
    fill_in('trip[start_station_id]', with: 1)
    fill_in('trip[end_date]', with: "2017-01-01")
    fill_in('trip[end_station]', with: "SF City Hall")
    fill_in('trip[end_station_id]', with: 2)
    fill_in('trip[bike_id]', with: 2)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="Update"]').click

    expect(page).to have_current_path('/trips/1')
  end

  it "user's changes are saved" do
    visit '/trips/1/edit'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-08")
    fill_in('trip[start_station]', with: "Alcatraz")
    fill_in('trip[start_station_id]', with: 1)
    fill_in('trip[end_date]', with: "2017-01-09")
    fill_in('trip[end_station]', with: "SF City Hall")
    fill_in('trip[end_station_id]', with: 2)
    fill_in('trip[bike_id]', with: 1)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="Update"]').click

    expect(page).to have_content("60")
    expect(page).to have_content("2017-01-08")
    expect(page).to have_content("Alcatraz")
    expect(page).to have_content("2017-01-09")
    expect(page).to have_content("SF City Hall")
    expect(page).to have_content(1)
    expect(page).to have_content("Customer")
  end
end
