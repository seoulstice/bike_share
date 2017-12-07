describe "When a visitor submits a new trip" do
  it "is redirected to that trip's page" do
    visit '/trips/new'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-01")
    fill_in('trip[start_station_name]', with: "Alcatraz")
    fill_in('trip[start_station_id]', with: 2)
    fill_in('trip[end_date]', with: "2017-01-01")
    fill_in('trip[end_station_name]', with: "SF City Hall")
    fill_in('trip[end_station_id]', with: 2)
    fill_in('trip[bike_id]', with: 2)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="New"]').click

    expect(page).to have_current_path('/trips/1001')
  end

  it "new trip is saved" do
    visit '/trips/new'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-01")
    fill_in('trip[start_station_name]', with: "San Jose Diridon Caltrain Station")
    fill_in('trip[start_station_id]', with: 2)
    fill_in('trip[end_date]', with: "2017-01-01")
    fill_in('trip[end_station_name]', with: "San Jose Civic Center")
    fill_in('trip[end_station_id]', with: 3)
    fill_in('trip[bike_id]', with: 2)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="New"]').click

    expect(page).to have_content("60")
    expect(page).to have_content("2017-01-01")
    expect(page).to have_content(2)
    expect(page).to have_content("San Jose Diridon Caltrain Station")
    expect(page).to have_content(3)
    expect(page).to have_content("San Jose Civic Center")
    expect(page).to have_content("Customer")
  end
end
