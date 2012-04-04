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
    dates.first
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
    ParseResult.new(dates)
  end

  def dates(date_line)
    match = /(\d\d)(\d\d)(\d\d)/.match(date_line)
    raise "No dates found in #{date_line}" unless match

    year = "20#{match[1]}".to_i
    month = match[2].to_i
    day = match[3].to_i

    [Date.new(year,month,day)]

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
