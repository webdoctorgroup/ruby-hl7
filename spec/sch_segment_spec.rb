# encoding: UTF-8
require 'spec_helper'

describe HL7::Message::Segment::SCH do
  context 'general' do
    before :all do
      @base_sch = 'SCH|||||681|S^SCHEDULED|^BONE DENSITY PB,cf/RH |30^30 MINUTE APPOINTMENT|45|m|^^45^200905260930^200905261015|||||||||polly^^POLLY BRESCOCK|^^^^^^ ||||SCHEDULED'
    end

    it 'creates an SCH segment' do
      lambda do
        sch = HL7::Message::Segment::SCH.new( @base_sch )
        sch.should_not be_nil
        sch.to_s.should eq @base_sch
      end.should_not raise_error
    end

    it 'allows access to an SCH segment' do
      lambda do
        sch = HL7::Message::Segment::SCH.new( @base_sch )
        sch.schedule_id.should eq '681'
        sch.event_reason.should eq 'S^SCHEDULED'
        sch.appointment_reason.should eq '^BONE DENSITY PB,cf/RH '
        sch.appointment_type.should eq '30^30 MINUTE APPOINTMENT'
        sch.appointment_duration.should eq '45'
        sch.appointment_duration_units.should eq 'm'
        sch.entered_by_person.should eq 'polly^^POLLY BRESCOCK'
        sch.filler_status_code.should eq 'SCHEDULED'
      end.should_not raise_error
    end
  end
end
