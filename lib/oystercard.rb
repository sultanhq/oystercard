class Card

  STARTING_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :journeys


  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @maximum_balance = MAXIMUM_BALANCE
    @entry_station = []
    @journeys = []
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

  def touch_out(station)
    deduct(MINIMUM_FARE)
    add_to_journey(station)
    @entry_station.clear
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def under_minimum_balance?
    balance < MINIMUM_FARE
  end

  def add_to_journeys(station)
    @journeys << {entry_station[0] => station}
  end

end
