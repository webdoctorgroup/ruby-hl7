require 'spec_helper'

class SegmentNoChildren< HL7::Message::Segment
end

class SegmentWithChildren < HL7::Message::Segment
  has_children [:NTE,:OBX,:ORC,:SPM]
end

describe HL7::Message::SegmentListStorage do
  describe "Adding childs using has_children and add_child_type" do
    subject do
      segment_instance = segment_class.new
      methods = [:accepts?, :child_types, :children].each do |m|
        segment_instance.respond_to?(m).should be_true
      end
    end

    context "when child_types is not present" do
      let(:segment_class){ SegmentNoChildren }

      it "should call the has_children method" do
        segment_instance = segment_class.new
        segment_instance.respond_to?(:children).should be_false

        segment_class.add_child_type(:OBR)
        subject

      end
    end

    context "when child_types is present" do
      let(:segment_class){ SegmentWithChildren }

      it "should call the has_children method" do
        subject
      end
    end
  end
end