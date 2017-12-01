describe "when a visitor visits the Station Dashboard" do
  it "displays information for all stations" do
    visits '/station-dashboard'

    expect(page).to have_current_path('/station-dashboard')
    expect(page).to have_content("Station Dashboard")
    expect(page).to have_content("Total # of Stations: 72")
    expect(page).to have_content("Average Dock Count: 17.92")
    expect(page).to have_content("Station with Most Docks: #")
    expect(page).to have_content("Maximum Dock Count: 27")
    expect(page).to have_content("Station with Least Docks: #")
    expect(page).to have_content("Mininum Dock Count: 11")
    expect(page).to have_content("Newest Station: San Jose Civic Center
")
    expect(page).to have_content("Oldest Station: Ryland Park")
  end
end
