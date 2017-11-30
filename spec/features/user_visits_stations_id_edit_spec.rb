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
  end

  it "changes the station values and they are saved" do
    visit '/stations/2/edit'
    fill_in('station[name]', with: "North SF")
    fill_in('station[city]', with: "SF")
    fill_in('station[dock_count]', with: 2)
    fill_in('station[installation_date]', with: "2017-01-01")
    find('input[name="Update"]').click

    expect(page).to have_current_path('/stations/2')

  end

  it "sees banner" do
    visit '/stations/1/edit'

    expect(page).to have_current_path('/stations/1/edit')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
  end
end
