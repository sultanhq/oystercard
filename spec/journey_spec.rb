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

  context "storing trip" do
    it "trip should be empty upon initialization" do
      expect(journey.trip).to eq({ entry_station: nil, exit_station: nil })
    end

    it "should put the entry station into the trip hash" do
      journey.start(entry_station)
      journey.save_entry
      expect(journey.trip[:entry_station]).to eq(entry_station)
    end

    it "should put the exit station into the trip hash" do
      journey.finish(exit_station)
      journey.save_exit
      expect(journey.trip[:exit_station]).to eq(exit_station)
    end
  end
  context "fares" do
    it "should charge minimum fare if touching in and out normally" do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.total_fare).to eq 1
    end

  end

  context "edge cases" do

    it "should charge penalty fare if touching out without touching in" do
      journey.finish(exit_station)
      expect(journey.total_fare).to eq 6
    end

    it "should charge penalty fare if touching in without having touched out" do
      journey.start(entry_station)
      journey.start(exit_station)
      expect(journey.total_fare).to eq 6
    end



  end
end
