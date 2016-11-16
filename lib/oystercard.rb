require_relative 'journey_log.rb'

class Card

  STARTING_BALANCE = 0
  MAXIMUM_BALANCE = 90


  attr_reader :balance, :entry_station, :journey_log


  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @maximum_balance = MAXIMUM_BALANCE
    @journey_log = JourneyLog.new
  end

  def top_up(value)
    raise "You cannot top-up over your limit of #{MAXIMUM_BALANCE}" if balance + value > MAXIMUM_BALANCE
    @balance += value
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise "Insufficient funds" if under_minimum_balance?
    @entry_station = station
    journey_log.start(station)
  end

  def touch_out(station)
    add_to_journeys(station)
    deduct(journey_log.journeys.last.fare)
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def under_minimum_balance?
    balance < Journey::MINIMUM_FARE
  end

  def add_to_journeys(station)
    journey_log.finish(station)
  end

end
