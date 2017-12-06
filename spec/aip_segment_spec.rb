# encoding: UTF-8
require 'spec_helper'

describe HL7::Message::Segment::AIP do
  context 'general' do
    before :all do
      @base_aip = 'AIP|1|U|JSB^ISON^Kathy^S|D^Doctor||20020108150000|||10|m^Minutes'
    end

    it 'creates an AIP segment' do
      lambda do
        aip = HL7::Message::Segment::AIP.new( @base_aip )
        aip.should_not be_nil
        aip.to_s.should eq @base_aip
      end.should_not raise_error
    end

    it 'allows access to an AIP segment' do
      lambda do
        aip = HL7::Message::Segment::AIP.new( @base_aip )
        aip.set_id.should eq '1'
        aip.segment_action_code.should eq 'U'
        aip.personnel_resource_id.should eq 'JSB^ISON^Kathy^S'
        aip.resource_role.should eq 'D^Doctor'
        aip.start_date_time.should eq '20020108150000'
        aip.duration.should eq '10'
        aip.duration_units.should eq 'm^Minutes'
      end.should_not raise_error
    end
  end
end
