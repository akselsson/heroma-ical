#encoding: utf-8
require 'spec_helper'
require 'states/days_state'


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
end
