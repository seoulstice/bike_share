describe "when a visitor visits the Weather Dashboard" do
  it "sees banner" do
    visit '/weather-dashboard'

    expect(page).to have_current_path('/weather-dashboard')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
    expect(page).to have_link("Trips Dashboard")
    expect(page).to have_link("Conditions Index")
    expect(page).to have_link("Weather Dashboard")
  end

  it "displays all collected weather conditions" do
    visit '/weather-dashboard'

    expect(page).to have_current_path('/weather-dashboard')

    expect(page).to have_content("Dashboard Summary")
    expect(page).to have_content("Ride Breakdown by Temperature")
    expect(page).to have_content("Ride Breakdown by Wind Speed")
    expect(page).to have_content("Ride Breakdown by Precipitation")
    expect(page).to have_content("Ride Breakdown by Visibility")
  end

  it "clicks on Station Index link" do
    visit '/weather-dashboard'

    click_link("Station Index")

    expect(page).to have_current_path('/stations')
  end

  it "clicks on Station Dashboard link" do
    visit '/weather-dashboard'

    click_link("Station Dashboard")

    expect(page).to have_current_path('/station-dashboard')
  end

  it "clicks on Trips Index link" do
    visit '/weather-dashboard'

    click_link("Trips Index")

    expect(page).to have_current_path('/trips')
  end

  it "clicks on Trips Dashboard link" do
    visit '/weather-dashboard'

    click_link("Trips Dashboard")

    expect(page).to have_current_path('/trip-dashboard')
  end

  it "clicks on Conditions Index link" do
    visit '/weather-dashboard'

    click_link("Conditions Index")

    expect(page).to have_current_path('/conditions')
  end

  it "clicks on Weather Dashboard link" do
    visit '/weather-dashboard'

    click_link("Weather Dashboard")

    expect(page).to have_current_path('/weather-dashboard')
  end

  it "clicks on the Home breadcrumb" do
    visit '/weather-dashboard'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Conditions breadcrumb" do
    visit '/weather-dashboard'

    click_link("Conditions")

    expect(page).to have_current_path('/conditions')
  end
end
