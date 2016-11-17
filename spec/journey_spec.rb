require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  context "entry station" do
    it 'should have no entry station before starting a journey' do
      expect(journey.entry_station).to be_nil
    end
  end
end
