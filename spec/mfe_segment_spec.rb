# encoding: UTF-8
require 'spec_helper'

describe HL7::Message::Segment::MFE do
  context 'general' do
    before :all do
      @base_sft = 'MFE|MAD|6772331|200106290500|BUD^Buddhist^HL70006|CE'
    end

    it 'creates an MFE segment' do
      lambda do
        sft = HL7::Message::Segment::MFE.new( @base_sft )
        sft.should_not be_nil
        sft.to_s.should == @base_sft
      end.should_not raise_error
    end

    it 'allows access to an MFE segment' do
      lambda do
        sft = HL7::Message::Segment::MFE.new( @base_sft )
        sft.record_level_event_code.should == 'MAD'
        sft.mfn_control_id.should == '6772331'
        sft.primary_key_value.should == 'BUD^Buddhist^HL70006'
        sft.primary_key_value_type.should == 'CE'
      end.should_not raise_error
    end
  end
end
