require_relative "station.rb"
require_relative "journey.rb"
class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_JOURNEY = 1
  PENALTY_CHARGE = 6

  attr_reader :balance, :all_journeys

  def initialize
    @balance = DEFAULT_BALANCE
    @all_journeys = []
  end

  def top_up(top_up_value)
    raise "Can't exceed maximum balance of £#{MAXIMUM_BALANCE}." if @balance + top_up_value > MAXIMUM_BALANCE
    @balance += top_up_value
  end


    def touch_in(station)
         if !@journey.nil? then @balance -= PENALTY_CHARGE end
         @journey = Journey.new; @journey.start_journey(station)
        raise "Cannot touch in: minimum required balance is £#{MINIMUM_JOURNEY}, please top up." if @balance < MINIMUM_JOURNEY
         @entry_station = station

        end


  def touch_out(station)
    if @journey.nil? then return @balance -= PENALTY_CHARGE  end
    deduct(MINIMUM_JOURNEY)
    @journey.end_journey(station); @all_journeys << @journey.last_journey

  end

  def in_journey?
    return false if @journey == nil
    !(@journey.entry_station).nil?
  end

  private
    def deduct(fare)
      @balance -= fare
    end

end
