#! /usr/bin/env ruby
require_relative '../lib/schedule'
require 'pdf-reader'

puts ARGV[0]
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
puts schedule.to_s
