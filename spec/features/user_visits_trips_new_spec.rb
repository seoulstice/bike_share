describe 'When a visitor visits new trip page' do
  it 'sees new trip form' do
    visit '/trips/new'

    expect(page).to have_current_path('/trips/new')

    expect(page).to have_field('trip[duration]')
    expect(page).to have_field('trip[start_date]')
    expect(page).to have_field('trip[end_date]')
    expect(page).to have_field('trip[start_station]')
    expect(page).to have_field('trip[end_station]')
    expect(page).to have_field('trip[bike_id]')
    expect(page).to have_field('trip[subscription_type]')
  end

  it 'sees banner' do
    visit '/trips/new'

    expect(page).to have_current_path('/trips/new')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "clicks on the Home breadcrumb" do
    visit '/trips/new'

    click_on("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Trips breadcrumb" do
    visit '/trips/new'

    click_on("Trips")

    expect(page).to have_current_path('/trips')
  end
end
