describe "When a visistor visits individual trip" do
  it "sees the correct trip with an Edit link" do
    visit '/trips/1'

    expect(page).to have_current_path('/trips/1')

    expect(page).to have_content("Trip 1")
    expect(page).to have_content("Duration: 63")
    expect(page).to have_content("Start Date: 2013-08-29")
    expect(page).to have_content("Start Station: South Van Ness at Market")
    expect(page).to have_content("End Date: 2013-08-29")
    expect(page).to have_content("End Station: South Van Ness at Market")
    expect(page).to have_content("Bike ID: 520")
    expect(page).to have_content("Zip Code: 94127")
  end

  it "sees banner" do
    visit '/trips/1'

    expect(page).to have_current_path('/trips/1')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "clicks on the Home breadcrumb" do
    visit '/trips/1'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Trips breadcrumb" do
    visit '/trips/new'

    click_link("Trips")

    expect(page).to have_current_path('/trips')
  end
end
