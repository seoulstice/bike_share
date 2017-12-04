describe "When a visitor visits stations" do
  it "sees banner" do
    visit '/stations'

    expect(page).to have_current_path('/stations')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "sees all stations" do
    visit '/stations'

    expect(page).to have_current_path('/stations')

    expect(page).to have_content("All Stations")
    expect(page).to have_content("SJSU 4th")
    expect(page).to have_link("Castro Street and El Camino")
    expect(page).to have_link("New Station")
  end

  it "clicks on a specific station link" do
    visit '/stations'

    click_on("Mountain View Caltrain Station")

    expect(page).to have_current_path('/stations/28')
  end

  it "click on a new station link" do
    visit '/stations'

    click_link("New Station")

    expect(page).to have_current_path('/stations/new')
  end

  it "clicks on the Home breadcrumb" do
    visit '/stations'

    click_on("Home")

    expect(page).to have_current_path('/')
  end
end
