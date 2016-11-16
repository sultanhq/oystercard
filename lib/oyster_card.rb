class Oystercard

attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    fail "Card cannot be loaded over £#{MAXIMUM_BALANCE}." if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end


  def touch_in(entry_station)
    fail "Not enough funds to travel" if @balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = entry_station
  end

  def in_journey?
    @in_journey
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_journey = false
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
