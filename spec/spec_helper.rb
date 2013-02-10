require 'simplecov'

if ENV["COVERAGE"]
  SimpleCov.start do
    add_filter "/test/"
    add_filter "/spec/"
  end
end

$: << '../lib'

require File.expand_path('../../lib/segment_list_storage', __FILE__)
require File.expand_path('../../lib/ruby-hl7', __FILE__)
require File.expand_path('../../lib/segment', __FILE__)
require File.expand_path('../../lib/test/hl7_messages', __FILE__)
require File.expand_path('../../lib/core_ext/string', __FILE__)
require File.expand_path('../../lib/core_ext/date_time', __FILE__)
