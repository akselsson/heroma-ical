require 'spec_helper'
require 'states/header_state'
require 'states/days_state'

describe HeaderState do
  it 'does nothing on empty line' do
    new_state = subject.visit('')
    new_state.should be_a(HeaderState)
  end
  it 'switches to days state after tider' do
    new_state = subject.visit('Tider')
    new_state.should be_a(DaysState)
  end
end
