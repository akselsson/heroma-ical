require 'event_parser'
class Schedule
  attr_reader :events
  def initialize(events=[])
    @events = events 
  end
  def self.parse(strings)
    EventParser.parse(strings)
  end

  def add_event(start_time,end_time)
    events << Event.new(start_time,end_time)
  end
end
