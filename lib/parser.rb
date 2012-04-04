#encoding: utf-8
require 'ostruct'
class Parser
  def initialize(text)
    @text = text
  end

  def parse
    lines = @text.lines
    schedule_lines = lines.drop_while {|l| !(l =~ /Tider/) }.drop(1).take_while {|l| !(l =~ /Anmärkningar/) }
    week_lines = get_weeks(schedule_lines)
    dates = week_lines.collect {|ll| WeekParser.new.parse(ll[0],"") }
    ParseResult.new(dates.flatten)
  end

  def get_weeks(lines)
    weeks = []
    current_week =[] 
    lines.each do |l|
      if /^\s*V./ =~ l
        current_week = []
        weeks << current_week
      end
      current_week << l
    end
    weeks
  end
end

class WeekParser
  def parse(date_line,times_line)
    dates = dates(date_line)
  end

  def dates(date_line)
    dates = []
    date_line.scan(/(\d\d)(\d\d)(\d\d)/) do |y,m,d|
      year = "20#{y}".to_i
      month = m.to_i
      day = d.to_i
      dates << Date.new(year,month,day)
    end
    dates
  end
end

class ParseResult
  def initialize(dates)
    @dates = dates
  end
  def days
    @dates.collect {|d| Day.new(d) }
  end
end

class Day
  attr_reader :date
  def initialize(date)
    @date = date
  end
end
