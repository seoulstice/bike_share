describe "When a visitor visits individual station" do
  it "sees the correct station with an Edit link" do
    visit '/stations/1'

    expect(page).to have_current_path('/stations/1')

    expect(page).to have_content("South SF")
    expect(page).to have_content("SF")
    expect(page).to have_content("12")
    expect(page).to have_content("2017-01-19")
    expect(page).to have_link('Edit')
    expect(page).to have_selector('input[name="Delete"]')
  end

  it "clicks on Edit link" do
    visit '/stations/1'

    click_link('Edit')

    expect(page).to have_current_path('/stations/1/edit')
  end

  it "sees banner" do
    visit '/stations/1'

    expect(page).to have_current_path('/stations/1')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
  end

  it "clicks on the Home breadcrumb" do
    visit '/stations/1'

    click_on("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Stations breadcrumb" do
    visit '/stations/1'

    click_on("Stations")

    expect(page).to have_current_path('/stations')
  end
end
