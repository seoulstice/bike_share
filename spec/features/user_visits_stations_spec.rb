describe "When a visitor visits stations" do
  before(:each) do
    @station = Station.create(name: "South SF", city: "SF", dock_count: 12, installation_date: "2017-01-01")
  end

  it "sees all stations" do
    visit '/stations'

    expect(page).to have_current_path('/stations')

    expect(page).to have_content("All Stations")
    expect(page).to have_content("South SF")
  end
end
