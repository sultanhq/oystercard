class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  attr_reader :balance

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @in_use  = false
  end

  def top_up(top_up_value)
    raise "Can't exceed maximum balance of £#{MAXIMUM_BALANCE}." if @balance + top_up_value > MAXIMUM_BALANCE
    @balance += top_up_value
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

end
