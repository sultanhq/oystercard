class Card

  STARTING_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station


  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @maximum_balance = MAXIMUM_BALANCE
    @entry_station = []
  end

  def top_up(value)
    raise "You cannot top-up over your limit of #{MAXIMUM_BALANCE}" if balance + value > MAXIMUM_BALANCE
    @balance += value
  end


  def in_journey?
    @entry_station.any?
  end

  def touch_in(station)
    raise "Insufficient funds" if under_minimum_balance?
    @entry_station << station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station.clear
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def under_minimum_balance?
    balance < MINIMUM_FARE
  end

end
