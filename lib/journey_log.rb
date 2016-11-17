require_relative 'journey.rb'

class JourneyLog

  attr_reader :journey, :all_journeys

  def initialize(journey_class)
    @journey = journey_class.new
    @all_journeys = []
  end

  def start(station)
    @all_journeys << {:entry_station => @journey.start_journey(station)} if current_journey?
    @journey.start_journey(station)
  end

  def finish(station)
    @journey.end_journey(station)
    @all_journeys << journey.current_journey
  end


  private

  def deduct_fare
    if !@journey.nil? then @balance = @balance + PENALTY_CHARGE
    end
  end

  def current_journey?
    @journey.current_journey.nil? && @journey.exit_station.nil?
  end

end
