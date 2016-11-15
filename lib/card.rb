class Oystercard
  
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_JOURNEY = 1

  attr_reader :balance

  def initialize(balance=DEFAULT_BALANCE)
    @balance = balance
    @in_use  = false
  end

  def top_up(top_up_value)
    raise "Can't exceed maximum balance of £#{MAXIMUM_BALANCE}." if @balance + top_up_value > MAXIMUM_BALANCE
    @balance += top_up_value
  end

  def touch_in
    raise "Cannot touch in: minimum required balance is £#{MINIMUM_JOURNEY}, please top up." if balance < MINIMUM_JOURNEY
    @in_use = true
  end

  def touch_out
    deduct(MINIMUM_JOURNEY)
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  private
    def deduct(fare)
      @balance -= fare
    end

end
