require 'journey_log.rb'

describe JourneyLog do
  subject(:journey_log) {described_class.new(Journey)}


  context "when #start" do
    it "should create a journey" do
      journey_log.start("London")
     expect(journey_log.journey).to be_instance_of(Journey)
    end
  end

  context "when #finish" do
    it "should return the finish station" do
      journey_log.start("London")
      answer = [{:entry_station => "London", :exit_station => "Leeds"}]
      expect(journey_log.finish("Leeds")).to eq answer
    end

  end


    it 'should recall a stored journey' do
      journey_log.start("London")
      journey_log.finish("Leeds")
      answer = {:entry_station => "London", :exit_station => "Leeds"}
      expect(journey_log.journey.current_journey).to eq answer
    end

    it 'saves all the journeys' do
      journey_log.start("London")
      journey_log.finish("Leeds")
      journey_log.start("Bath")
      journey_log.finish("Cardif")
      answer = [{:entry_station => "London", :exit_station => "Leeds"}, {:entry_station => "Bath", :exit_station => "Cardif"}]
      expect(journey_log.all_journeys).to eq answer
    end

    it 'saves incomplete journeys' do
      journey_log.start("London")
      journey_log.start("Bath")
      journey_log.finish("Cardif")
      answer = [{:entry_station => "London"}, {:entry_station => "Bath", :exit_station => "Cardif"}]
      expect(journey_log.all_journeys).to eq answer
    end

end
