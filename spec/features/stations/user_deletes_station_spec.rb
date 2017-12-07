describe "When a user deletes a station" do
  it "the station is deleted" do
    visit '/stations/5'

    click_on("Delete")

    expect(page).to_not have_content("Adobe on Almaden")
  end

  it "after station is deleted user is on stations page" do
    visit '/stations/7'
    find('input[name="Delete"]').click

    expect(page).to have_current_path("/stations")
  end

  it "clicks on the Home breadcrumb" do
    visit '/stations/9'

    click_link("Home")

    expect(page).to have_current_path('/')
  end

  it "clicks on the Stations breadcrumb" do
    visit '/stations/11'

    click_link("Stations")

    expect(page).to have_current_path('/stations')
  end
end
