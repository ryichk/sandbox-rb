class Gate
  STATIONS = [:ichinoe, :hunabori, :higashiojima]
  FARES = [160, 190]

  def initialize(station)
    @station = station
  end

  def enter(ticket)
    ticket.stamp(@station)
  end

  def exit(ticket)
    fare = calcurate_fare(ticket)
    fare <= ticket.fare
  end

  def calcurate_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@station)
    distance = to - from
    FARES[distance - 1]
  end
end
