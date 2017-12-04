describe "When a visitor visits conditions" do
  it "sees banner" do
    visit '/conditions'

    expect(page).to have_current_path('/conditions')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trip Index")
    expect(page).to have_link("Trip Dashboard")
  end

  it "sees all conditions" do
    visit '/conditions'

    expect(page).to have_current_path('/conditions')

    expect(page).to have_content("All Conditions")
    expect(page).to have_content("")
    expect(page).to have_link("")
  end

  it "clicks on a specific station link" do
    visit '/conditions'

    click_link("#{@condition.name}")

    expect(page).to have_current_path('/conditions/1')
  end

  it "click on a new station link" do
    visit '/conditions'

    click_link("New Condition")

    expect(page).to have_current_path('/conditions/new')
  end

  it "clicks on the Home breadcrumb" do
    visit '/conditions'

    click_link("Home")

    expect(page).to have_current_path('/')
  end
end
