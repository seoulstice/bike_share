describe "When a visitor visits conditions index" do
  it "sees banner" do
    visit '/conditions'

    expect(page).to have_current_path('/conditions')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Conditions Index")
    expect(page).to have_link("Weather Dashboard")
  end

  it "sees all stations" do
    visit '/conditions'

    expect(page).to have_current_path('/conditions')

    expect(page).to have_content("Conditions on 2013-08-29")
    expect(page).to have_content("Max Temperature (F): 74.0")
    expect(page).to have_content("Mean Temperature (F): 68.0")
    expect(page).to have_content("Min Temperature (F): 61.0")
    expect(page).to have_content("Mean Humidity: 75.0")
    expect(page).to have_content("Mean Visibility (mile): 10.0")
    expect(page).to have_content("Mean Wind Speed (mph): 11.0")
    expect(page).to have_content("Mean Precipitation (inches): 0.0")
    expect(page).to have_link("Conditions on 2013-08-31")
    expect(page).to have_link("Conditions on 2013-09-07")
  end

  it "clicks on a specific condition link" do
    visit '/conditions'

    click_on("Conditions on 2013-09-05")

    expect(page).to have_current_path('/conditions/8')
  end

  it "click on a new condition link" do
    visit '/conditions'

    click_link("New Weather Condition")

    expect(page).to have_current_path('/conditions/new')
  end

  it "clicks on the Home breadcrumb" do
    visit '/conditions'

    click_on("Home")

    expect(page).to have_current_path('/')
  end
end
