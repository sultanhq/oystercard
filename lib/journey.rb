class Journey
  attr_reader :entry_station, :exit_station, :trip

  def initialize
    @entry_station = nil
    @exit_station = nil
    @trip = Hash.new
  end

  def start(station)
    self.entry_station = station
  end

  def finish(station)
    self.exit_station = station
  end

  def save_trip
    self.trip = { entry_station: self.entry_station, exit_station: self.exit_station }
  end

  private
  attr_writer :entry_station, :exit_station, :trip
end
