class Card

STARTING_BALANCE = 5

attr_reader :balance,:limit

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @limit = 30
  end

  def add_money(value)
    @balance += value
  end


end
