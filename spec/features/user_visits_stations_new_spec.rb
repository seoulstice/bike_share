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
  end
end
