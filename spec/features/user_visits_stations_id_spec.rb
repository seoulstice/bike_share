describe "When a visitor visits individual station" do
  before(:each) do
    @station_1 = Station.create(name: "South SF", city: "SF", dock_count: 12, installation_date: "2017-01-01")
    @station_2 = Station.create(name: "North SJ", city: "SJ", dock_count: 14, installation_date: "2017-01-10")
  end

  it "sees the correct station with an Edit link" do
    visit '/stations/1'

    expect(page).to have_current_path('/stations/1')

    expect(page).to have_content("South SF")
    expect(page).to have_content("SF")
    expect(page).to have_content("12")
    expect(page).to have_content("2017-01-01")
    expect(page).to have_link('Edit')
    expect(page).to have_selector('input[name="Delete"]')
  end

  it "clicks on Edit link" do
    visit '/stations/1'

    click_on('Edit')

    expect(page).to have_current_path('/stations/1/edit')
  end

  it "sees banner" do
    visit '/stations'

    expect(page).to have_current_path('/stations')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
  end
end
