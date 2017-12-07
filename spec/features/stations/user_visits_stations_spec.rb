describe "When a visitor visits stations" do
  it "sees all stations" do
    visit '/stations'

    expect(page).to have_current_path('/stations')

    expect(page).to have_content("19")
    expect(page).to have_content("SJSU 4th")
    expect(page).to have_link("Castro Street and El Camino")
    expect(page).to have_link("New Station")
  end

  it "has working navigation" do
    visit '/stations'

    expect(page).to have_current_path('/stations')

    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Weather Dashboard")
    expect(page).to have_link("Conditions Index")
  end

  it "clicks on a specific station link" do
    visit '/stations'

    click_link("Mountain View Caltrain Station")

    expect(page).to have_current_path('/stations/28')
  end

  it "click on a new station link" do
    visit '/stations'

    click_link("New Station")

    expect(page).to have_current_path('/stations/new')
  end
end
