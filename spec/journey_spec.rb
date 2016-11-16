require 'journey'
describe Journey do
  subject(:journey) {described_class.new}
  let(:station) {double(:station)}
  let(:station2) {double(:station)}

    context "when starting a journey it" do

      it 'Should save an entry_station when starting a journey' do
        expect(journey.start_journey(station)).to eq journey.entry_station
      end

      it "should save an exit station when ending a journey" do
        journey.end_journey(station)
        expect(journey.exit_station).to eq station
      end
end
    context "once has has completed" do
      it "should save the journey in a hash" do
        journey.start_journey(station)
        journey.end_journey(station2)
        expect(journey.last_journey).to eq({:entry_station => station, :exit_station => station2})
      end
    end
end
