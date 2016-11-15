class Card

STARTING_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

attr_reader :balance,:maximum_balance,:in_journey,:entry_station


  def initialize(balance = STARTING_BALANCE, maximum_balance = MAXIMUM_BALANCE, in_journey = false)
    @balance = balance
    @maximum_balance = maximum_balance
    @in_journey = in_journey
    @entry_station = []
  end

  def top_up(value)
    raise "You cannot top-up over your limit of #{@maximum_balance}" if @balance + value > @maximum_balance
    @balance += value
  end


  def in_journey?
    @entry_station.any?
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MINIMUM_FARE
    @entry_station << station
  end

  def touch_out(fare)
    deduct(fare)
    @entry_station.pop
  end



private

  def deduct(fare)
    @balance -= fare
  end

end
