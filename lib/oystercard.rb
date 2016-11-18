require_relative "journey"

class Oystercard

attr_reader :balance, :in_journey, :journey_history, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = nil
    @journey_history = []
    @journey = Journey.new
  end

  def top_up(amount)
    fail "Card cannot be loaded over £#{MAXIMUM_BALANCE}." if self.balance + amount > MAXIMUM_BALANCE
    self.balance += amount
  end

  def touch_in(entry_station)
    fail "Not enough funds to travel" if self.balance < MINIMUM_BALANCE
    journey.start(entry_station)
    self.in_journey = true
  end

  def in_journey?
    self.in_journey
  end

  def touch_out(exit_station)
    deduct(MINIMUM_BALANCE)
    self.journey.finish(exit_station)
    self.journey_history << journey.trip
    self.in_journey = false
  end

  private
  attr_writer :balance, :in_journey

  def deduct(amount)
    self.balance -= amount
  end

end
