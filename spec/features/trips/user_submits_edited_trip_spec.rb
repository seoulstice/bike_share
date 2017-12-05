describe "When a user updates an existing station" do
  it "the submit button redirects to trip show page" do
    visit '/trips/13/edit'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-01")
    fill_in('trip[start_station]', with: "Alcatraz")
    fill_in('trip[start_station_id]', with: 13)
    fill_in('trip[end_date]', with: "2017-01-01")
    fill_in('trip[end_station]', with: "SF City Hall")
    fill_in('trip[end_station_id]', with: 2)
    fill_in('trip[bike_id]', with: 2)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="Update"]').click

    expect(page).to have_current_path('/trips/13')
  end

  it "user's changes are saved" do
    visit '/trips/13/edit'
    fill_in('trip[duration]', with: 60)
    fill_in('trip[start_date]', with: "2017-01-08")
    fill_in('trip[start_station]', with: "Alcatraz")
    fill_in('trip[start_station_id]', with: 13)
    fill_in('trip[end_date]', with: "2017-01-09")
    fill_in('trip[end_station]', with: "SF City Hall")
    fill_in('trip[end_station_id]', with: 2)
    fill_in('trip[bike_id]', with: 1)
    fill_in('trip[subscription_type]', with: "Customer")
    find('input[name="Update"]').click

    expect(page).to have_content("60")
    expect(page).to have_content("2017-01-08")
    expect(page).to have_content("Alcatraz")
    expect(page).to have_content("2017-01-09")
    expect(page).to have_content("SF City Hall")
    expect(page).to have_content(1)
    expect(page).to have_content("Customer")
  end
end
