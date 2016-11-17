require_relative "journey"

class Oystercard

attr_reader :balance, :entry_station, :journey_history, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = []
  end

  def top_up(amount)
    fail "Card cannot be loaded over £#{MAXIMUM_BALANCE}." if self.balance + amount > MAXIMUM_BALANCE
    self.balance += amount
  end

  def touch_in(entry_station)
    fail "Not enough funds to travel" if self.balance < MINIMUM_BALANCE
    @journey = Journey.new
    journey.start(entry_station)
    self.entry_station = entry_station
  end

  def in_journey?
    !self.entry_station.nil?
  end

  def touch_out(exit_station)
    deduct(MINIMUM_BALANCE)
    self.journey.finish(exit_station)
    self.journey_history << journey.save_trip
    self.entry_station = nil
  end

  private
  attr_writer :balance, :entry_station

  def deduct(amount)
    self.balance -= amount
  end

end
