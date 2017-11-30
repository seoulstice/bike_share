describe "When a visitor submits a new station" do
  it "is redirected to that station's page" do
    visit '/stations/new'
    fill_in('station[name]', with: "North SF")
    fill_in('station[city]', with: "SF")
    fill_in('station[dock_count]', with: 2)
    fill_in('station[installation_date]', with: "2017-01-01")
    find('input[name="New"]').click

    expect(page).to have_current_path('/stations/1')
  end

  it "new station is saved" do
    visit '/stations/new'
    fill_in('station[name]', with: "North SF")
    fill_in('station[city]', with: "SF")
    fill_in('station[dock_count]', with: 2)
    fill_in('station[installation_date]', with: "2017-01-01")
    find('input[name="New"]').click

    expect(page).to have_content("North SF")
    expect(page).to have_content("SF")
    expect(page).to have_content(2)
    expect(page).to have_content("2017-01-01")
  end
end
