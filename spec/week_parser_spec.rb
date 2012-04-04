#necoding: utf-8
require 'parser'
require 'date'

describe WeekParser do
  it 'should get date from week with single day' do
    subject.parse('V. 13Sön 120401','Föräldraledighet')[0].should == Date.new(2012,04,01)

  end
end
