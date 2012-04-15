require_relative 'event'
require_relative 'schedule'

require_relative 'states/header_state'
require_relative 'states/state'

class EventParser
  attr_reader :schedule

  def initialize
    @state = HeaderState.new
    @schedule = Schedule.new
  end

  def parse(strings)
    strings.each do |s|
      @state.schedule = @schedule if @state.respond_to?(:schedule)
      @state=@state.visit s
    end
  end

  def self.parse(strings)
    parser = EventParser.new
    parser.parse strings
    parser.schedule
  end
end
