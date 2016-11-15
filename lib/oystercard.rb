class Card

STARTING_BALANCE = 0
MAXIMUM_BALANCE = 90

attr_reader :balance,:maximum_balance

  def initialize(balance = STARTING_BALANCE, maximum_balance = MAXIMUM_BALANCE)
    @balance = balance
    @maximum_balance = maximum_balance
  end

  def top_up(value)
    raise "You cannot top-up over your limit of #{@maximum_balance}" if @balance + value > @maximum_balance
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

end
