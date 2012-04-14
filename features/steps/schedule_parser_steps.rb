#encoding: utf-8
#
require 'schedule'
require 'event'
När /^jag tolkar ett schema med$/ do |table|
  @schedule = Schedule.parse(table.hashes.map {|h| h["text"]})
end

Så /^ska följande schema skapas$/ do |table|
  events = table.hashes.map {|h| Event.new(DateTime.parse(h["start"]),DateTime.parse(h["slut"])) }

  @schedule.events.should == events
end
