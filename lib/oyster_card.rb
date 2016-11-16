class Oystercard

attr_reader :balance, :entry_station, :station_history

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @station_history = []
  end

  def top_up(amount)
    fail "Card cannot be loaded over £#{MAXIMUM_BALANCE}." if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end


  def touch_in(entry_station)
    fail "Not enough funds to travel" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_out(exit_station)
    deduct(MINIMUM_BALANCE)
    @station_history << {entry_station: @entry_station, exit_station: exit_station}
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
