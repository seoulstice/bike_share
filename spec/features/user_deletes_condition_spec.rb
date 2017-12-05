describe "When a user deletes a condition" do
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

    expect(page).to have_current_path("/conditions")
  end
end
