describe "when a visitor visits the Station Dashboard" do
  it "displays information for all stations" do
    visit '/station-dashboard'

    expect(page).to have_current_path('/station-dashboard')
    expect(page).to have_content("Station Dashboard")
    expect(page).to have_content("Total # of Stations:")
    expect(page).to have_content("Average Dock Count:")
    expect(page).to have_content("Station with Most Docks:")
    expect(page).to have_content("Maximum Dock Count:")
    expect(page).to have_content("Station with Least Docks:")
    expect(page).to have_content("Mininum Dock Count:")
    expect(page).to have_content("Newest Station:")
    expect(page).to have_content("Oldest Station:")
  end

  it "sees banner" do
    visit '/station-dashboard'

    expect(page).to have_current_path('/station-dashboard')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
    expect(page).to have_link("Trips Dashboard")
    expect(page).to have_link("Conditions Index")
    expect(page).to have_link("Weather Dashboard")
  end

  it "clicks on Station Index link" do
    visit '/station-dashboard'

    click_link("Station Index")

    expect(page).to have_current_path('/stations')
  end

  it "clicks on Station Dashboard link" do
    visit '/station-dashboard'

    click_link("Station Dashboard")

    expect(page).to have_current_path('/station-dashboard')
  end

  it "clicks on the Home breadcrumb" do
    visit '/station-dashboard'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Stations breadcrumb" do
    visit '/station-dashboard'

    click_link("Stations")

    expect(page).to have_current_path('/stations')
  end
end
