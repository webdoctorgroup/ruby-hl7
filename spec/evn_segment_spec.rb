# encoding: UTF-8
require 'spec_helper'

describe HL7::Message::Segment::EVN do
  context 'general' do
    before :all do
      @base = "EVN|A04|20060705000000"
    end

    it 'allows access to an EVN segment' do
      evn = HL7::Message::Segment::EVN.new @base
      evn.type_code.should == "A04"
    end

    it 'allows creation of an OBX segment' do
      evn = HL7::Message::Segment::EVN.new
      evn.event_facility="A Facility"
      evn.event_facility.should == 'A Facility'
    end
  end
end
