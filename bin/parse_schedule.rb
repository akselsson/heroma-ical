#! /usr/bin/env ruby
require_relative '../lib/schedule'
require 'pdf-reader'

reader = PDF::Reader.new(ARGV[0])

strings = []

walker =Class.new do
  attr_reader :strings
  def initialize
    @strings = []
  end
  def show_text(arg)
    @strings << arg
  end
end.new

reader.pages.each do |page|
  page.walk walker
end

schedule = Schedule.parse walker.strings
cal = schedule.to_ical
cal.export_to $stdout

