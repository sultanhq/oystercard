class Card

STARTING_BALANCE = 5

attr_reader :balance

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
  end

end
