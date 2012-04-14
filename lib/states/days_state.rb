require 'date'
require 'time'
require_relative 'state'
class DaysState
  include State
  attr_reader :days
  def initialize()
    @days = []
  end
  def visit(text)
    case text
    when /(\d\d)(\d\d)(\d\d)/
      @days << Date.new("20#{$1}".to_i,$2.to_i,$3.to_i)
    when /(\d\d:\d\d)-(\d\d:\d\d)/
      start_time = Time.parse $1
      end_time = Time.parse $2
      date = @days.pop
      start_date = DateTime.new(date.year,date.month,date.day,start_time.hour,start_time.min)
      end_date = DateTime.new(date.year,date.month,date.day,end_time.hour,end_time.min)
      schedule.add_event(start_date,end_date)
    end

    self
  end
end
