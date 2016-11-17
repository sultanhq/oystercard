require_relative "station.rb"
require_relative "journey.rb"
require_relative 'journey_log.rb'

class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_JOURNEY = 1
  PENALTY_CHARGE = -6

  attr_reader :balance, :all_journeys, :journey_log

  def initialize
    @balance = DEFAULT_BALANCE
    @all_journeys = []
    @journey_log = JourneyLog.new
  end

  def top_up(top_up_value)
    raise "Can't exceed maximum balance of £#{MAXIMUM_BALANCE}." if @balance + top_up_value > MAXIMUM_BALANCE
    @balance += top_up_value
  end


    def touch_in(station)
      if !@journey.nil? then @balance = @balance + PENALTY_CHARGE end
      @journey = @journey_log.start
      @journey.start_journey(station)
      raise "Cannot touch in: minimum required balance is £#{MINIMUM_JOURNEY}, please top up." if @balance < MINIMUM_JOURNEY
    end


  def touch_out(station)
    if @journey.nil? then return @balance = @balance + PENALTY_CHARGE  end
    @journey.end_journey(station)
    deduct(@journey.fare)
    @all_journeys << @journey.last_journey

  end

  def in_journey?
    return false if @journey == nil
    !(@journey.entry_station).nil?
  end

  private
    def deduct(fare)
      @balance += fare
    end

end
