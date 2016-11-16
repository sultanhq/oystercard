class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(station = nil)
    start(station)
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    self
  end

  def incomplete?
    entry_station.nil? || exit_station.nil?
  end

  def complete?
    !incomplete?
  end

  def fare
    return calculated_fare if complete?
    PENALTY_FARE
  end

private

  def calculated_fare
    MINIMUM_FARE + (entry_station.zone - exit_station.zone).abs
  end

end
