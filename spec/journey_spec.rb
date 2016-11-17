require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  context "entry station" do
    it 'should have no entry station before starting a journey' do
      expect(journey.entry_station).to be_nil
    end
    it 'should store the station name when the journey has started' do
      journey.start(entry_station)
      expect(journey.entry_station).to eq entry_station
    end
  end

  context "exit station" do
    it 'should store the station name when exiting the station' do
      journey.finish(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
  end
end
