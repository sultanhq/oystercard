class Oystercard

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_JOURNEY = 1

  attr_reader :balance, :entry_station, :exit_station, :journey, :all_journeys

  def initialize
    @balance = DEFAULT_BALANCE
    @all_journeys = []
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

  def touch_out(station)
    deduct(MINIMUM_JOURNEY)

    @exit_station = station
    @journey = {:entry_station => @entry_station, :exit_station => @exit_station}
    @all_journeys << @journey
    @entry_station = nil
    @exit_station = nil

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
