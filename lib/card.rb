class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_JOURNEY = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(top_up_value)
    raise "Can't exceed maximum balance of £#{MAXIMUM_BALANCE}." if @balance + top_up_value > MAXIMUM_BALANCE
    @balance += top_up_value
  end

  def touch_in(station)
    raise "Cannot touch in: minimum required balance is £#{MINIMUM_JOURNEY}, please top up." if @balance < MINIMUM_JOURNEY
    @entry_station = station
    true
  end

  def touch_out
    deduct(MINIMUM_JOURNEY)
    @entry_station = nil
    true
  end

  def in_journey?
    @entry_station != nil
  end

  private
    def deduct(fare)
      @balance -= fare
    end

end
