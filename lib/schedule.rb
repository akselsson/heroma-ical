require_relative 'event_parser'
require 'ri_cal'

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

  def to_s
    events.map { |e| "#{e.starts}-#{e.ends}" }.join("\n")
  end

  def to_ical
    RiCal.Calendar do |cal|
      events.each do |e|
        cal.event do |event|
          event.description = 'Anna jobbar'
          event.dtstart = e.starts
          event.dtend = e.ends
        end
      end
    end
  end
end
