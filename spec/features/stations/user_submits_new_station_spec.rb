describe "When a visitor submits a new station" do
  it "new station is saved" do
    visit '/stations/new'
    fill_in('station[name]', with: "North SF")
    fill_in('station[city]', with: "SF")
    fill_in('station[dock_count]', with: 2)
    fill_in('station[installation_date]', with: "2017-01-01")
    fill_in('station[latitude]', with: 40.1023)
    fill_in('station[longitude]', with: -30.1235)

    find('input[name="New"]').click

    expect(page).to have_content("North SF")
    expect(page).to have_content("SF")
    expect(page).to have_content(2)
    expect(page).to have_content("2017-01-01")
  end

  it "is redirected to that station's page" do
    visit '/stations/new'
    fill_in('station[name]', with: "North SF")
    fill_in('station[city]', with: "SF")
    fill_in('station[dock_count]', with: 2)
    fill_in('station[installation_date]', with: "2017-01-01")
    fill_in('station[latitude]', with: 40.1023)
    fill_in('station[longitude]', with: -30.1235)

    find('input[name="New"]').click

    expect(page).to have_current_path("/stations/86")
  end

  it "clicks on the Home breadcrumb" do
    visit '/stations/new'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Stations breadcrumb" do
    visit '/stations/new'

    click_link("Stations")

    expect(page).to have_current_path('/stations')
  end
end
