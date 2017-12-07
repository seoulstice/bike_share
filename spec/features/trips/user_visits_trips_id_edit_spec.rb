describe "When a visitor visits edit trip" do
  it "displays an edit form with current values" do
    visit '/trips/1/edit'

    expect(page).to have_current_path('/trips/1/edit')

    expect(page).to have_field("trip[duration]")
    expect(page).to have_selector('input[value="63"]')
    expect(page).to_not have_selector('input[value="120"]')
    expect(page).to have_field("trip[start_date]")
    expect(page).to_not have_selector('input[value="2017-01-02"]')
    expect(page).to have_field("trip[start_station_name]")
    expect(page).to have_selector('input[value="South Van Ness at Market"]')
    expect(page).to_not have_selector('input[value="Japantown"]')
    expect(page).to have_field("trip[end_date]")
    expect(page).to_not have_selector('input[value="2017-01-03"]')
    expect(page).to have_field("trip[end_station_name]")
    expect(page).to have_selector('input[value="South Van Ness at Market"]')
    expect(page).to_not have_selector('input[value="Lower Haight"]')
    expect(page).to have_field("trip[bike_id]")
    expect(page).to have_selector('input[value="520"]')
    expect(page).to_not have_selector('input[value="11"]')
    expect(page).to have_field("trip[subscription_type]")
    expect(page).to have_selector('input[value="Subscriber"]')
    expect(page).to_not have_selector('input[value="Customer"]')
  end

  it "sees banner" do
    visit '/trips/1/edit'

    expect(page).to have_current_path('/trips/1/edit')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "clicks on the Home breadcrumb" do
    visit '/trips/1/edit'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Trips breadcrumb" do
    visit '/trips/1/edit'

    click_link("Trips")

    expect(page).to have_current_path('/trips')
  end

  it "clicks on the individual trip id breadcrumb" do
    visit '/trips/13/edit'

    click_link("13")

    expect(page).to have_current_path('/trips/13')
  end
end
