describe "When a visitor visits conditions index" do
  it "sees all stations" do
    visit '/conditions'

    expect(page).to have_current_path('/conditions')

    expect(page).to have_content("2013-08-29")
    expect(page).to have_content("74.0")
    expect(page).to have_content("68.0")
    expect(page).to have_content("61.0")
    expect(page).to have_content("75.0")
    expect(page).to have_content("10.0")
    expect(page).to have_content("11.0")
    expect(page).to have_content("0.0")
    expect(page).to have_link("2013-08-31")
    expect(page).to have_link("2013-09-07")
  end

  it "has working navigation" do
    visit '/trips'

    expect(page).to have_current_path('/trips')

    expect(page).to have_link("Station Dashboard")
    expect(page).to have_link("Trips Index")
    expect(page).to have_link("Weather Dashboard")
  end

  it "clicks on a specific condition link" do
    visit '/conditions'

    click_link("2013-09-05")

    expect(page).to have_current_path('/conditions/8')
  end

  it "click on a new condition link" do
    visit '/conditions'

    click_link("New Condition")

    expect(page).to have_current_path('/conditions/new')
  end

  it "only the next pagination link shows up on index" do
    visit '/conditions'

    expect(page).to have_link("»")
  end

  it "has working next pagination" do
    visit '/conditions'

    click_link("»")

    expect(page).to have_current_path('/conditions?page=2')
  end

  it "has full pagination outside of index" do
    visit '/conditions?page=2'

    expect(page).to have_link("«")
    expect(page).to have_content("2")
    expect(page).to have_link("»")
  end

  it "has a working previous pagination" do
    visit '/conditions?page=3'

    click_link("«")

    expect(page).to have_current_path('/conditions?page=2')
  end
end
