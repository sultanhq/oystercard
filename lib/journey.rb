
class Journey
  attr_reader :entry_station, :exit_station, :current_journey
  MINIMUM_FARE = -1
  PENALTY_FARE = -6

  def start_journey(station)
    @entry_station = station
    @current_journey = {:entry_station => @entry_station}
  end

  def end_journey(station)
    @exit_station = station
     @current_journey[:exit_station] = @exit_station
  end

    def fare
      return PENALTY_FARE if @entry_station.nil? || @exit_station.nil?
      return MINIMUM_FARE
    end
end
