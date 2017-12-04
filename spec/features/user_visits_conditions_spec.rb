describe "When a visitor visits conditions" do
  it "sees banner" do
    visit '/conditions'

    expect(page).to have_current_path('/conditions')

    expect(page).to have_content("SF Bike Share")
    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Station Index")
    expect(page).to have_link("Trips Index")
    expect(page).to have_link("Trips Dashboard")
  end

  it "sees all conditions" do
    visit '/conditions'

    expect(page).to have_current_path('/conditions')

    expect(page).to have_content("All Conditions")

    expect(page).to have_link("Conditions on #{Condition.first.date}")
    expect(page).to have_content(74)
    expect(page).to have_content(68)
    expect(page).to have_content(61)
    expect(page).to have_content(75)
    expect(page).to have_content(10)
    expect(page).to have_content(11)
    expect(page).to have_content(0)
  end

  it "clicks on a specific condition link" do
    visit '/conditions'

    click_on("Conditions on #{Condition.first.date}")

    expect(page).to have_current_path('/conditions/1')
  end

  it "click on a new condition link" do
    visit '/conditions'

    click_link("New Weather Condition")

    expect(page).to have_current_path('/conditions/new')
  end

  it "clicks on the Home breadcrumb" do
    visit '/conditions'

    click_link("Home")

    expect(page).to have_current_path('/')
  end
end
