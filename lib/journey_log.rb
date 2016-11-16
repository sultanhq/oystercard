require_relative 'journey.rb'

class JourneyLog

  attr_reader :journey, :journeys

  def initialize
    @journey = Journey
    @journeys= []
  end

  def start(station)
    (@journeys << journey.new(station)).last
  end

  def finish(station)
    (@journeys << current_journey.finish(station)).last
  end

  private

  def current_journey
    return journeys.pop if journeys.any? && journeys.last.incomplete?
    journey.new
  end
end
