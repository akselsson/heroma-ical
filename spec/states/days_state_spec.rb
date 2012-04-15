#encoding: utf-8
require 'spec_helper'
require 'states/days_state'
require 'date'
require 'schedule'

describe DaysState do
  context 'for weeknumber' do
    let(:next_state) {subject.visit(' V. 13') }
    it 'does not change state' do
      next_state.should be_a(DaysState)
    end
  end

  context 'for date' do
    let!(:next_state) { subject.visit('Sön 120401') }

    it 'does not change state' do
      next_state.should be_a(DaysState)
    end
    it 'adds a day' do
      subject.days.should == [Date.new(2012,4,1)] 
    end
  end

  context 'for time' do
    before { subject.days << Date.new(2012,04,01) }
    let!(:next_state) {subject.visit('13:00-21:30(30)') }

    it 'removes a day' do
      subject.days.should be_empty
    end
    it 'adds an event' do
      subject.schedule.events.should == [Event.new(DateTime.parse('2012-04-01 13:00'),DateTime.parse('2012-04-01 21:30'))]
    end

  end

  context 'with muliple previous dates' do
    before { 
      subject.days << Date.new(2012,04,01) 
      subject.days << Date.new(2012,04,02) 
    }
    let!(:next_state) {subject.visit('13:00-21:30(30)') }

    it 'removes a day' do
      subject.days.should == [Date.new(2012,04,02)]
    end
    it 'adds an event' do
      subject.schedule.events.should == [Event.new(DateTime.parse('2012-04-01 13:00'),DateTime.parse('2012-04-01 21:30'))]
    end

  end
end
