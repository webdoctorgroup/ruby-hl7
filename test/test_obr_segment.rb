# encoding: UTF-8
$: << '../lib'
require 'test/unit'
require 'ruby-hl7'

class ObrSegment < Test::Unit::TestCase
  def setup
    @base = "OBR|2|^USSSA|0000000567^USSSA|37956^CT ABDOMEN^LN|||199405021550|||||||||||||0000763||||NMR|P||||||R/O TUMOR|202300&BAKER&MARK&E|||01&LOCHLEAR&JUDY"
    @obr = HL7::Message::Segment::OBR.new @base
  end

  def test_read
    assert_equal( @base, @obr.to_s )
    assert_equal( "2", @obr.e1 )
    assert_equal( "2", @obr.set_id )
    assert_equal( "^USSSA", @obr.placer_order_number )
    assert_equal( "0000000567^USSSA", @obr.filler_order_number )
    assert_equal( "37956^CT ABDOMEN^LN", @obr.universal_service_id )
  end

  def test_create
    @obr.set_id = 1
    assert_equal( "1", @obr.set_id )
    @obr.placer_order_number = "^DMCRES"
    assert_equal( "^DMCRES", @obr.placer_order_number )
  end

  def test_diagnostic_serv_sect_id
    assert @obr.respond_to?(:diagnostic_serv_sect_id)
    assert_equal "NMR", @obr.diagnostic_serv_sect_id
  end

  def test_result_status
    assert @obr.respond_to?(:result_status)
    assert_equal "P", @obr.result_status
  end

  def test_reason_for_study
    assert_equal "R/O TUMOR", @obr.reason_for_study
  end

end
