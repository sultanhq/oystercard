class Journey
  attr_reader :entry_station, :exit_station, :trip

  def initialize
    @entry_station = nil
    @exit_station = nil
    @trip = { entry_station: nil, exit_station: nil }
  end

  def start(station)
    self.entry_station = station
    save_entry
  end

  def finish(station)
    self.exit_station = station
    save_exit
  end

  def save_entry
    self.trip[:entry_station] = self.entry_station
  end

  def save_exit
    self.trip[:exit_station] = self.exit_station
  end

  private
  attr_writer :entry_station, :exit_station, :trip
end
