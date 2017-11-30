describe "When a user deletes a station" do
  before(:each) do
    @station_1 = Station.create(name: "South SF", city: "SJ", dock_count: 12, installation_date: "2017-01-01")
  end

  it "the station is deleted" do
    visit '/stations/1'
    find('input[name="Delete"]').click

    expect(page).to_not have_content("South SF")
    expect(page).to_not have_content("SJ")
    expect(page).to_not have_content(12)
    expect(page).to_not have_content("2017-01-01")
  end

  it "after station is deleted user is on stations page" do
    visit '/stations/1'
    find('input[name="Delete"]').click

    expect(page).to have_current_path("/stations")
  end
end
