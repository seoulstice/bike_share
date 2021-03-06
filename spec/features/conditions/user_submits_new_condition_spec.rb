describe "When a visitor submits a new condition" do
  it "shows banner" do
    visit '/conditions/2/edit'

    expect(page).to have_current_path('/conditions/2/edit')

    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
    expect(page).to have_link("Conditions Index")
  end

  it "new condition is saved" do
    visit '/conditions/new'

    fill_in('condition[date]', with: "2013-11-20")
    fill_in('condition[max_temperature_f]',  with: 59)
    fill_in('condition[mean_temperature_f]', with: 55)
    fill_in('condition[min_temperature_f]',  with: 51)
    fill_in('condition[mean_humidity]',    with: 90)
    fill_in('condition[mean_visibility_miles]',with:  9)
    fill_in('condition[mean_wind_speed_mph]',  with:  7)
    fill_in('condition[precipitation_inches]', with: 0.63)

    find('input[name="Submit"]').click

    expect(page).to have_content("2013-11-20")
    expect(page).to have_content(59)
    expect(page).to have_content(55)
    expect(page).to have_content(51)
    expect(page).to have_content(90)
    expect(page).to have_content(9)
    expect(page).to have_content(7)
    expect(page).to have_content(0.63)
    expect(page).to have_content("Edit")
  end

  it "is redirected to that condition's page" do
    visit '/conditions/new'

    fill_in('condition[date]', with: "2013-11-20")
    fill_in('condition[max_temperature_f]',  with: 59)
    fill_in('condition[mean_temperature_f]', with: 55)
    fill_in('condition[min_temperature_f]',  with: 51)
    fill_in('condition[mean_humidity]',    with: 90)
    fill_in('condition[mean_visibility_miles]',with:  9)
    fill_in('condition[mean_wind_speed_mph]',  with:  7)
    fill_in('condition[precipitation_inches]', with: 0.63)

    find('input[name="Submit"]').click

    expect(page).to have_current_path("/conditions/735")
  end

  it "clicks on the Home breadcrumb" do
    visit '/weather-dashboard'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Conditions breadcrumb" do
    visit '/weather-dashboard'

    click_link("Conditions")

    expect(page).to have_current_path('/conditions')
  end
end
