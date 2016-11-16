require 'journey_log'

describe JourneyLog do
  subject(:journey_log) { described_class.new }

  let(:entry_station){double(:station, name: :aldgate_east)}
  let(:exit_station){double(:station, name: :whitechapel)}


  it "should hold a Journey class in a 'journey' attribute" do
    expect(journey_log.journey).to eq Journey
  end

  it "should store journeys" do
    expect(journey_log.journeys).to be_a_kind_of Array
  end

  it "should start as an empty log" do
    expect(journey_log.journeys).to eq []
  end

  it "should start a new journey" do
    journey_log.start(entry_station)
    expect(journey_log.journeys.last).to be_a_kind_of Journey
  end

  it "should finish a journey" do
    journey_log.start(entry_station)
    journey_log.finish(exit_station)
    expect(journey_log.journeys.last).to be_complete
  end

  it "should record an finished journey with no start point" do
    journey_log.finish(exit_station)
    expect(journey_log.journeys.last).to be_incomplete
    end

end
