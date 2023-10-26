# encoding: UTF-8
#= ruby-hl7.rb
# Ruby HL7 is designed to provide a simple, easy to use library for
# parsing and generating HL7 (2.x) messages.
#
#
# Author:    Mark Guzman  (mailto:segfault@hasno.info)
#
# Copyright: (c) 2006-2009 Mark Guzman
#
# License:   BSD
#
#  $Id$
#
# == License
# see the LICENSE file
#

require 'rubygems'
require 'stringio'
require 'date'
require 'configuration'

module HL7 # :nodoc:
  VERSION = '1.3.3'
  # Gives access to the current Configuration.
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Allows easy setting of multiple configuration options. See Configuration
  # for all available options.
  def self.configure
    config = configuration
    yield(config)
  end
end

# Encapsulate HL7 specific exceptions
class HL7::Exception < StandardError
end

# Parsing failed
class HL7::ParseError < HL7::Exception
end

# Attempting to use an invalid indice
class HL7::RangeError < HL7::Exception
end

# Attempting to assign invalid data to a field
class HL7::InvalidDataError < HL7::Exception
end

# Attempting to add an empty segment
# This error per configuration setting
class HL7::EmptySegmentNotAllowed < HL7::ParseError
end

require 'message_parser'
require_relative 'message'
require 'segment_list_storage'
require 'segment_generator'
require 'segment_fields'
require 'segment'
require 'segment_default'

require 'core_ext/date_time'
require 'core_ext/string'
