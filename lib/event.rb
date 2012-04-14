class Event
  attr_reader :starts, :ends
  def initialize(starts,ends)
    @starts = starts
    @ends = ends
  end

  def ==(event)
    event.instance_of?(Event) &&
      event.starts == starts &&
      event.ends == ends
  end
end
