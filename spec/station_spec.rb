require 'station'

describe Station do

  subject(:station) {described_class.new("Barbican", "Zone1")}

  it {is_expected.to respond_to :name}
  it {is_expected.to respond_to :zone}

  context "when initialized it" do
    it "should have a name" do
      expect(station.name).to eq "Barbican"
    end

    it "should have a zone" do
      expect(station.zone).to eq "Zone1"
    end
  end

end
