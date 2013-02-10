module HL7::MessageParser
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def parse_batch(batch) # :yields: message
      raise HL7::ParseError, 'badly_formed_batch_message' unless
        batch.hl7_batch?

      batch = clean_batch_for_jruby batch

      raise HL7::ParseError, 'empty_batch_message' unless
        match = /\rMSH/.match(batch)

      match.post_match.split(/\rMSH/).each_with_index do |_msg, index|
        if md = /\rBTS/.match(_msg)
          # TODO: Validate the message count in the BTS segment
          # should == index + 1
          _msg = md.pre_match
        end

        yield 'MSH' + _msg
      end
    end

    # parse a String or Enumerable object into an HL7::Message if possible
    # * returns a new HL7::Message if successful
    def parse( inobj )
      HL7::Message.new do |msg|
        msg.parse( inobj )
      end
    end

      # JRuby seems to change our literal \r characters in sample
    # messages (from here documents) into newlines.  We make a copy
    # here, reverting to carriage returns.  The input is unchanged.
    #
    # This does not occur when posts are received with CR
    # characters, only in sample messages from here documents.  The
    # expensive copy is only incurred when the batch message has a
    # newline character in it.
    def clean_batch_for_jruby(batch)
      batch.gsub("\n", "\r") if batch.include?("\n")
    end
  end

  # parse the provided String or Enumerable object into this message
  def parse( inobj )
    unless inobj.kind_of?(String) || inobj.respond_to?(:each)
      raise HL7::ParseError.new( "object to parse should be string or enumerable" )
    end

    if inobj.kind_of?(String)
        parse_string( inobj )
    elsif inobj.respond_to?(:each)
        parse_enumerable( inobj )
    end
  end

  private
  # Get the element delimiter from an MSH segment
  def parse_element_delim(str)
    (str && str.kind_of?(String)) ? str.slice(3,1) : "|"
  end

  # Get the item delimiter from an MSH segment
  def parse_item_delim(str)
    (str && str.kind_of?(String)) ? str.slice(4,1) : "^"
  end

  def parse_enumerable( inary )
    #assumes an enumeration of strings....
    inary.each do |oary|
      parse_string( oary.to_s )
    end
  end

  def parse_string( instr )
    post_mllp = instr
    if /\x0b((:?.|\r|\n)+)\x1c\r/.match( instr )
      post_mllp = $1 #strip the mllp bytes
    end

    ary = post_mllp.split( segment_delim, -1 )
    generate_segments( ary )
  end
end