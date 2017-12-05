describe "When a user updates an existing condition" do
  it "sees banner" do
    visit '/conditions/8'

    expect(page).to have_current_path('/conditions/8')

    expect(page).to have_link("Trips Dashboard")
    expect(page).to have_link("Weather Dashboard")
  end

  it "the submit button redirects to condition show page" do
    visit '/conditions/84/edit'

    fill_in('condition[date]', with: "2013-11-20")
    fill_in('condition[max_temperature_f]',  with: 59)
    fill_in('condition[mean_temperature_f]', with: 55)
    fill_in('condition[min_temperature_f]',  with: 51)
    fill_in('condition[mean_humidity]',    with: 90)
    fill_in('condition[mean_visibility_miles]',with:  9)
    fill_in('condition[mean_wind_speed_mph]',  with:  7)
    fill_in('condition[precipitation_inches]', with: 0.63)
    find('input[name="Update"]').click

    expect(page).to have_current_path('/conditions/84')
  end

  it "user's changes are saved" do
    visit '/conditions/84/edit'

    fill_in('condition[date]', with: "2013-11-20")
    fill_in('condition[max_temperature_f]',  with: 59)
    fill_in('condition[mean_temperature_f]', with: 55)
    fill_in('condition[min_temperature_f]',  with: 51)
    fill_in('condition[mean_humidity]',    with: 90)
    fill_in('condition[mean_visibility_miles]',with:  9)
    fill_in('condition[mean_wind_speed_mph]',  with:  7)
    fill_in('condition[precipitation_inches]', with: 0.63)
    find('input[name="Update"]').click

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

  it "clicks on the individual condition id breadcrumb" do
    visit '/conditions/2/edit'

    click_link("2")

    expect(page).to have_current_path('/conditions/2')
  end
end
