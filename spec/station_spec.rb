
require "./lib/station"

describe Station do
subject(:station) {described_class.new}

  it "should initialize with a name" do
    expect(station.name).to eq "Aldgate"
end

it "should initialize with a zone" do
  expect(station.zone).to eq 1
end

end
