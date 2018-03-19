# encoding: UTF-8
require 'spec_helper'

describe HL7::Message::Segment::IN1 do
  context 'general' do
    before :all do
      @base_in1 = 'IN1|1||752|ACORDIA NATIONAL||||A|GRP|||||||SMITH^JOHN|19|19700102||||||||||||||||||WC23732763278A|||||||||||||||||X'
    end

    it 'creates an IN1 segment' do
      lambda do
        in1 = HL7::Message::Segment::IN1.new( @base_in1 )
        in1.should_not be_nil
        in1.to_s.should eq @base_in1
      end.should_not raise_error
    end

    it 'allows access to an IN1 segment' do
      lambda do
        in1 = HL7::Message::Segment::IN1.new( @base_in1 )
        in1.set_id.should eq '1'
        in1.insurance_company_id.should eq '752'
        in1.insurance_company_name.should eq 'ACORDIA NATIONAL'
        in1.group_number.should eq 'A'
        in1.group_name.should eq 'GRP'
        in1.name_of_insured.should eq 'SMITH^JOHN'
        in1.insureds_relationship_to_patient.should eq '19'
        in1.insureds_date_of_birth.should eq '19700102'
        in1.policy_number.should eq 'WC23732763278A'
        in1.vip_indicator.should eq 'X'
      end.should_not raise_error
    end
  end
end
