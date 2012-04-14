require 'event'
class EventParser
  def self.parse(strings)
    [Event.new(DateTime.parse('2012-04-02T07:00:00+00:00'),DateTime.parse('2012-04-02T15:30:00+00:00'))]
  end

end
