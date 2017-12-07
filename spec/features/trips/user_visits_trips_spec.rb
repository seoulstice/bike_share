describe "When a user visits trips" do
  it "sees all trips" do
    visit '/trips'

    expect(page).to have_current_path('/trips')

    expect(page).to have_content("San Jose City Hall")
    expect(page).to have_content("Subscriber")
    expect(page).to have_link("Trip 1")
    expect(page).to have_link("New Trip")
  end

  it "has working navigation" do
    visit '/trips'

    expect(page).to have_current_path('/trips')

    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Dashboard")
    expect(page).to have_link("Conditions Index")
  end

  it "clicks on a specific trip link" do
    visit '/trips'

    click_link('Trip 1')

    expect(page).to have_current_path('/trips/1')
  end

  it "click on a new trip link" do
    visit '/trips'

    click_link("New Trip")

    expect(page).to have_current_path('/trips/new')
  end
end
