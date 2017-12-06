describe "When a user deletes a condition" do
  it "sees banner" do
    visit '/conditions/8'

    expect(page).to have_current_path('/conditions/8')

    expect(page).to have_link("Trips Dashboard")
    expect(page).to have_link("Conditions Index")
  end

  it "the condition is deleted" do
    visit '/conditions/8'
    click_on("Delete")

    expect(page).to_not have_content("2013-09-05")
    expect(page).to_not have_link("aapple")
  end

  it "after condition is deleted visitor is on conditions index" do
    visit '/conditions/12'
    click_on("Delete")

    expect(page).to have_current_path("/conditions")
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
