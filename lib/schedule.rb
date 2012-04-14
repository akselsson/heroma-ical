require 'event_parser'
class Schedule
  attr_reader :events
  def initialize(events=[])
    @events = events 
  end
  def self.parse(strings)
    Schedule.new EventParser.parse(strings)
  end
end
