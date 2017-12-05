describe 'When a visitor visits individual condition page' do
  it "sees banner" do
    visit '/conditions/2'

    expect(page).to have_current_path('/conditions/2')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it 'sees the correct condition show page with Edit and Delete links' do
    visit '/conditions/2'

    expect(page).to have_current_path('/conditions/2')

    expect(page).to have_content("2")
    expect(page).to have_content("2013-08-30")
    expect(page).to have_content("78.0")
    expect(page).to have_content("69.0")
    expect(page).to have_content("60.0")
    expect(page).to have_content("70.0")
    expect(page).to have_content("10.0 miles")
    expect(page).to have_content("13.0 mph")
    expect(page).to have_content("0.0 inches")
    expect(page).to have_link('Edit')
    expect(page).to have_selector('input[name="Delete"]')
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
