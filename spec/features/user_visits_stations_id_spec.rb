describe "When a visitor visits individual station" do
  it "sees the correct station with an Edit link" do
    visit '/stations/12'

    expect(page).to have_current_path('/stations/12')

    expect(page).to have_content("SJSU 4th at San Carlos")
    expect(page).to have_content("San Jose")
    expect(page).to have_content("19")
    expect(page).to have_content("2013-08-07")
    expect(page).to have_link('Edit')
    expect(page).to have_selector('input[name="Delete"]')
  end

  it "clicks on Edit link" do
    visit '/stations/2'

    click_link('Edit')

    expect(page).to have_current_path('/stations/2/edit')
  end

  it "sees banner" do
    visit '/stations/2'

    expect(page).to have_current_path('/stations/2')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "clicks on the Home breadcrumb" do
    visit '/stations/2'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Stations breadcrumb" do
    visit '/stations/2'

    click_link("Stations")

    expect(page).to have_current_path('/stations')
  end
end
