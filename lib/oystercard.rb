class Card

STARTING_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

attr_reader :balance,:maximum_balance,:in_journey

  def initialize(balance = STARTING_BALANCE, maximum_balance = MAXIMUM_BALANCE, in_journey = false)
    @balance = balance
    @maximum_balance = maximum_balance
    @in_journey = in_journey
  end

  def top_up(value)
    raise "You cannot top-up over your limit of #{@maximum_balance}" if @balance + value > @maximum_balance
    @balance += value
  end


  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Insufficient funds" if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out(fare)
    deduct(fare)
    @in_journey = false
  end

private

  def deduct(fare)
    @balance -= fare
  end
  
end
