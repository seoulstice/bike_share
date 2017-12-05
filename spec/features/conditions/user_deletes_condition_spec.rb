describe "When a user deletes a condition" do
  it "sees banner" do
    visit '/conditions/8'

    expect(page).to have_current_path('/conditions/8')

    expect(page).to have_link("Station Index")
  end
  
  it "the condition is deleted" do
    visit '/conditions/8'
    click_on("Delete")

    expect(page).to_not have_content("2013-09-05")
    expect(page).to_not have_content(66)
    expect(page).to_not have_content(74)
  end

  it "after condition is deleted user is on conditions page" do
    visit '/conditions/12'
    click_on("Delete")

    expect(page).to have_current_path("/conditions/12")
  end
end
