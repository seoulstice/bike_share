describe "When a visitor visits edit station" do
  it "displays an edit form with current values" do
    visit '/stations/12/edit'

    expect(page).to have_current_path('/stations/12/edit')

    expect(page).to have_field("station[name]")
    expect(page).to have_selector('input[value="SJSU 4th at San Carlos"]')
    expect(page).to have_field("station[city]")
    expect(page).to have_selector('input[value="San Jose"]')
    expect(page).to have_field("station[dock_count]")
    expect(page).to have_selector('input[value="19"]')
    expect(page).to have_field("station[installation_date]")
    expect(page).to have_selector('input[value="2013-08-07"]')
    expect(page).to have_selector('input[name="Update"]')
  end

  it "sees banner" do
    visit '/stations/12/edit'

    expect(page).to have_current_path('/stations/12/edit')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "clicks on the Home breadcrumb" do
    visit '/stations/12/edit'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Stations breadcrumb" do
    visit '/stations/12/edit'

    click_link("SJSU 4th at San Carlos")

    expect(page).to have_current_path('/stations/12')
  end
end
