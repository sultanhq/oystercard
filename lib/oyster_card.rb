class Oystercard

attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Card cannot be loaded over £#{MAXIMUM_BALANCE}." if maximum_balance?(amount)
    @balance += amount
  end

  private

  def maximum_balance?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

end
