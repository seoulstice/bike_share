describe "When a user deletes a station" do
  it "the station is deleted" do
    visit '/stations/5'
    find('input[name="Delete"]').click

    expect(page).to_not have_content("Adobe on Almaden")
  end

  it "after station is deleted user is on stations page" do
    visit '/stations/7'
    find('input[name="Delete"]').click

    expect(page).to have_current_path("/stations")
  end
end
