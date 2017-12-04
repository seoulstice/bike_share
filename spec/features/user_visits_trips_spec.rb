describe "When a user visits trips" do
  it "sees banner" do
    visit '/trips'

    expect(page).to have_current_path('/trips')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "sees all trips" do
    visit '/trips'

    expect(page).to have_current_path('/trips')

    expect(page).to have_content("All Trips")
    expect(page).to have_content("Subscriber")
    expect(page).to have_link("Trip 1")
    expect(page).to have_link("New Trip")
  end

  it "clicks on a specific trip link" do
    visit '/trips'

    click_on("Trip 1")

    expect(page).to have_current_path('/trips/1')
  end

  it "click on a new trip link" do
    visit '/trips'

    click_on("New Trip")

    expect(page).to have_current_path('/trips/new')
  end
end
