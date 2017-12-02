describe "When a visitor visits edit station" do
  before(:each) do
    @station_1 = Station.create(name: "South SF", city: "SF", dock_count: 12, installation_date: "2017-01-01")
    @station_2 = Station.create(name: "North SJ", city: "SJ", dock_count: 14, installation_date: "2017-01-10")
  end

  it "displays an edit form with current values" do
    visit '/stations/1/edit'

    expect(page).to have_current_path('/stations/1/edit')

    expect(page).to have_field("station[name]")
    expect(page).to have_selector('input[value="South SF"]')
    expect(page).to have_field("station[city]")
    expect(page).to have_selector('input[value="SF"]')
    expect(page).to have_field("station[dock_count]")
    expect(page).to have_selector('input[value="12"]')
    expect(page).to have_field("station[installation_date]")
    expect(page).to have_selector('input[value="2017-01-01"]')
    expect(page).to have_selector('input[name="Update"]')
  end

  it "sees banner" do
    visit '/stations/1/edit'

    expect(page).to have_current_path('/stations/1/edit')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end
end
