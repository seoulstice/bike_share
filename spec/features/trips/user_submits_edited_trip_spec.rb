describe "When a user updates an existing trip" do
  it "the submit button redirects to trip show page" do
    visit '/trips/13/edit'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-01")
    fill_in('trip[start_station_name]', with: "Arena Green / SAP Center")
    fill_in('trip[start_station_id]', with: 13)
    fill_in('trip[end_date]', with: "2017-01-01")
    fill_in('trip[end_station_name]', with: "Harry Bridges Plaza (Ferry Building)")
    fill_in('trip[end_station_id]', with: 50)
    fill_in('trip[bike_id]', with: 2)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="Update"]').click

    expect(page).to have_current_path('/trips/13')
  end

  it "user's changes are saved" do
    visit '/trips/13/edit'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-08")
    fill_in('trip[start_station_name]', with: "Arena Green / SAP Center")
    fill_in('trip[start_station_id]', with: 14)
    fill_in('trip[end_date]', with: "2017-01-09")
    fill_in('trip[end_station_name]', with: "Harry Bridges Plaza (Ferry Building)")
    fill_in('trip[end_station_id]', with: 50)
    fill_in('trip[bike_id]', with: 1)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="Update"]').click

    expect(page).to have_content("60")
    expect(page).to have_content("2017-01-08")
    expect(page).to have_content("Arena Green / SAP Center")
    expect(page).to have_content("2017-01-09")
    expect(page).to have_content("Harry Bridges Plaza (Ferry Building)")
    expect(page).to have_content("Customer")
  end

  it "clicks on the Home breadcrumb" do
    visit '/trips/13/edit'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Trips breadcrumb" do
    visit '/trips/13/edit'

    click_link("Trips")

    expect(page).to have_current_path('/trips')
  end

  it "clicks on the individual trip id breadcrumb" do
    visit '/trips/13/edit'

    click_link("13")

    expect(page).to have_current_path('/trips/13')
  end
end
