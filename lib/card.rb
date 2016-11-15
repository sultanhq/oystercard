class Oystercard

attr_reader :balance

  Maximum_capacity = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Cannot top up: balance capacity of #{Maximum_capacity} has been exceeded" if @balance + amount > Maximum_capacity
    @balance += amount
  end
end
