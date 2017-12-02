describe "When a visitor visits edit trip" do
  before(:each) do
    Trip.create(duration: 60, start_date: "2017-01-01", start_station: "Alcatraz", end_date: "2017-01-01", end_station: "SF City Hall", bike_id: 2, subscription_type: "Customer")
    Trip.create(duration: 120, start_date: "2017-01-02", start_station: "Japantown", end_date: "2017-01-03", end_station: "Lower Haight", bike_id: 11, subscription_type: "Subscriber")
  end

  it "displays an edit form with current values" do
    visit '/trips/1/edit'

    expect(page).to have_current_path('/trips/1/edit')

    expect(page).to have_field("trip[duration]")
    expect(page).to have_selector('input[value="60"]')
    expect(page).to_not have_selector('input[value="120"]')
    expect(page).to have_field("trip[start_date]")
    expect(page).to have_selector('input[value="2017-01-01"]')
    expect(page).to_not have_selector('input[value="2017-01-02"]')
    expect(page).to have_field("trip[start_station]")
    expect(page).to have_selector('input[value="Alcatraz"]')
    expect(page).to_not have_selector('input[value="Japantown"]')
    expect(page).to have_field("trip[end_date]")
    expect(page).to have_selector('input[value="2017-01-01"]')
    expect(page).to_not have_selector('input[value="2017-01-03"]')
    expect(page).to have_field("trip[end_station]")
    expect(page).to have_selector('input[value="SF City Hall"]')
    expect(page).to_not have_selector('input[value="Lower Haight"]')
    expect(page).to have_field("trip[bike_id]")
    expect(page).to have_selector('input[value="2"]')
    expect(page).to_not have_selector('input[value="11"]')
    expect(page).to have_field("trip[subscription_type]")
    expect(page).to have_selector('input[value="Customer"]')
    expect(page).to_not have_selector('input[value="Subscriber"]')
  end

  it "sees banner" do
    visit '/trips/1/edit'

    expect(page).to have_current_path('/trips/1/edit')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end
end
