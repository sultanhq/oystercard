class Journey
  attr_reader :entry_station, :exit_station, :last_journey
  def start_journey(station)


    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station

    @last_journey = {:entry_station => @entry_station, :exit_station => @exit_station}
  end
end
