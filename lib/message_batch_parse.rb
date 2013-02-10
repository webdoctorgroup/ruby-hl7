module HL7::MessageBatchParse
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