require 'journey'

describe Journey do
  subject(:journey) {Journey.new}
  let(:start_station) {double(:aldgate_east, :zone => 1)}
  let(:finish_station) {double(:whitchapel, :zone => 2)}
  context 'Journey'

  it 'should accept an argument' do
    expect(journey).to respond_to(:start)
  end

  it 'should return the journey start point' do
    journey.start(start_station)
    expect(journey.entry_station).to eq start_station
  end

  it 'should return the journey finish point' do
    journey.finish(finish_station)
    expect(journey.exit_station).to eq finish_station
  end

  it 'should test if a journey is incomplete' do
    expect(journey).not_to be_complete
  end

  it 'should test if a journey is complete' do
    journey.start(start_station)
    journey.finish(finish_station)
    expect(journey).to be_complete
  end

  it 'should charge minimum fare if journey is complete' do
    journey.start(start_station)
    journey.finish(finish_station)
    expect(journey.fare).to eq Journey::MINIMUM_FARE +
      (start_station.zone - finish_station.zone).abs
  end

  it 'should charge penalty fare if journey is incomplete' do
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end


end
