describe "When a visitor visits new station page" do
  it "sees new station form" do
    visit '/stations/new'

    expect(page).to have_current_path('/stations/new')

    expect(page).to have_field("station[name]")
    expect(page).to have_field("station[city]")
    expect(page).to have_field("station[dock_count]")
    expect(page).to have_field("station[installation_date]")
  end

  it "sees banner" do
    visit '/stations/new'

    expect(page).to have_current_path('/stations/new')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "clicks on the Home breadcrumb" do
    visit '/stations/new'

    click_on("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Stations breadcrumb" do
    visit '/stations/new'

    click_on("Stations")

    expect(page).to have_current_path('/stations')
  end
end
