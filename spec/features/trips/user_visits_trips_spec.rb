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

  it "only the next pagination link shows up" do
    visit '/trips'

    expect(page).to have_link("»")
  end

  it "has working pagination" do
    visit '/trips'

    click_link("»")

    expect(page).to have_current_path('/trips?page=2')
  end

  it "has full pagination outside of index" do
    visit '/trips?page=2'

    expect(page).to have_link("«")
    expect(page).to have_content("2")
    expect(page).to have_link("»")
  end

  it "has a working previous pagination" do
    visit '/trips?page=3'

    click_link("«")

    expect(page).to have_current_path('/trips?page=2')
  end
end
