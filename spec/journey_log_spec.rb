require 'journey_log.rb'

describe JourneyLog do
  subject(:journey_log) {described_class.new}


  context "when #start" do
    it "should create a journey" do
     expect(journey_log.start).to be_instance_of(Journey)
    end
  end
  
end
