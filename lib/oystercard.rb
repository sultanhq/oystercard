class Card

STARTING_BALANCE = 0
LIMIT = 90

attr_reader :balance,:limit

  def initialize(balance = STARTING_BALANCE, limit = LIMIT)
    @balance = balance
    @limit = limit
  end

  def top_up(value)
    raise "You cannot top-up over your limit of #{@limit}" if @balance + value > @limit
    @balance += value
  end

end
