class Event
  attr_reader :starts, :ends, :description
  def initialize(starts,ends,description)
    @starts = starts
    @ends = ends
    @description = description
  end

  def ==(event)
    event.instance_of?(Event) &&
      event.starts == starts &&
      event.ends == ends &&
      event.description == description
  end
end
