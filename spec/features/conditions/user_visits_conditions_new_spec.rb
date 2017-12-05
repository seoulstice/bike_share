describe "When a visitor visits new condition page" do
  it "sees a banner" do
    visit '/conditions/new'

    expect(page).to have_current_path('/conditions/new')

    expect(page).to have_link("Trips Dashboard")
    expect(page).to have_link("Weather Dashboard")
  end

  it "sees new condition form" do
    visit '/conditions/new'

    expect(page).to have_current_path('/conditions/new')

    expect(page).to have_field("condition[date]")
    expect(page).to have_field("condition[max_temperature_f]")
    expect(page).to have_field("condition[mean_temperature_f]")
    expect(page).to have_field("condition[min_temperature_f]")
    expect(page).to have_field("condition[mean_humidity]")
    expect(page).to have_field("condition[mean_visibility_miles]")
    expect(page).to have_field("condition[mean_wind_speed_mph]")
    expect(page).to have_field("condition[precipitation_inches]")

    find('input[name="Submit"]').click
  end

  it "clicks on the Home breadcrumb" do
    visit '/conditions/new'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Conditions breadcrumb" do
    visit '/conditions/new'

    click_link("Conditions")

    expect(page).to have_current_path('/conditions')
  end
end
