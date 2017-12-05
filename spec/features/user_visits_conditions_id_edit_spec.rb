describe "When a visitor visits edit condition" do
  it "displays an edit form with current values" do
    visit '/conditions/2/edit'

    expect(page).to have_current_path('conditions/2/edit')

    expect(page).to have_field(cond)
  end
end
