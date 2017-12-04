describe "When a user deletes a trip" do
  it "the trip is deleted" do
    visit '/trips/5'
    find('input[name="Delete"]').click

    expect(page).to_not have_content("Trip 5")
  end

  it "after trip is deleted user is on trips page" do
    visit '/trips/450'
    find('input[name="Delete"]').click

    expect(page).to have_current_path("/trips")
  end
end
