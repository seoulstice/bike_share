describe "When a visitor visits edit condition" do
  it "displays an edit form with current values" do
    visit '/conditions/2/edit'

    expect(page).to have_current_path('/conditions/2/edit')

    expect(page).to have_field('condition[date]')
    expect(page).to have_selector('input[value="2013-08-30"]')

    expect(page).to have_field('condition[max_temperature_f]')
    expect(page).to have_selector('input[value="78.0"]')

    expect(page).to have_field('condition[mean_temperature_f]')
    expect(page).to have_selector('input[value="69.0"]')

    expect(page).to have_field('condition[min_temperature_f]')
    expect(page).to have_selector('input[value="60.0"]')

    expect(page).to have_field('condition[mean_humidity]')
    expect(page).to have_selector('input[value="70.0"]')

    expect(page).to have_field('condition[mean_visibility_miles]')
    expect(page).to have_selector('input[value="10.0"]')

    expect(page).to have_field('condition[mean_wind_speed_mph]')
    expect(page).to have_selector('input[value="13.0"]')

    expect(page).to have_field('condition[precipitation_inches]')
    expect(page).to have_selector('input[value="0.0"]')

    expect(page).to have_selector('input[name="Update"]')
  end

  it "clicks on the Home breadcrumb" do
    visit '/conditions/2/edit'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Conditions breadcrumb" do
    visit '/conditions/2/edit'

    click_link("Conditions")

    expect(page).to have_current_path('/conditions')
  end

  it "clicks on the individual condition id breadcrumb" do
    visit '/conditions/2/edit'

    click_link("2")

    expect(page).to have_current_path('/conditions/2')
  end
end
