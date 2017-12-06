# encoding: UTF-8
require 'spec_helper'

describe HL7::Message::Segment::AIL do
  context 'general' do
    before :all do
      @base_ail = 'AIL|1|A|OFFICE^^^OFFICE|^OFFICE^A4'
    end

    it 'creates an AIL segment' do
      lambda do
        ail = HL7::Message::Segment::AIL.new( @base_ail )
        ail.should_not be_nil
        ail.to_s.should eq @base_ail
      end.should_not raise_error
    end

    it 'allows access to an AIL segment' do
      lambda do
        ail = HL7::Message::Segment::AIL.new( @base_ail )
        ail.set_id.should eq '1'
        ail.segment_action_code.should eq 'A'
        ail.location_resource_id.should eq 'OFFICE^^^OFFICE'
        ail.location_type.should eq '^OFFICE^A4'
      end.should_not raise_error
    end
  end
end
