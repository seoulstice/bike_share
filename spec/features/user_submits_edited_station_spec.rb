describe "When a user updates an existing station" do
  before(:each) do
    @station_1 = Station.create(name: "South SF", city: "SF", dock_count: 12, installation_date: "2017-01-01")
    @station_2 = Station.create(name: "North SJ", city: "SJ", dock_count: 14, installation_date: "2017-01-10")
  end

  it "the submit button redirects to station show page" do
    visit '/stations/2/edit'
    fill_in('station[name]', with: "North SF")
    fill_in('station[city]', with: "SF")
    fill_in('station[dock_count]', with: 2)
    fill_in('station[installation_date]', with: "2017-01-01")
    find('input[name="Update"]').click

    expect(page).to have_current_path('/stations/2')
  end

  it "user's changes are saved" do
    visit '/stations/2/edit'
    fill_in('station[name]', with: "North SF")
    fill_in('station[city]', with: "SF")
    fill_in('station[dock_count]', with: 2)
    fill_in('station[installation_date]', with: "2017-01-01")
    find('input[name="Update"]').click

    expect(page).to have_content("North SF")
    expect(page).to have_content("SF")
    expect(page).to have_content(2)
    expect(page).to have_content("2017-01-01")
  end
end
