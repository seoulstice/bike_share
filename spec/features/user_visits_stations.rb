describe "When a visitor visits stations" do
  let(:station) {Station.create(name: "South SF",
                                city: "SF",
                                )}
  it "visitor sees all stations" do
    visit '/stations'

    expect()
  end
end
