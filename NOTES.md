## Overview

Version 0.4.0 of the ruby-hl7 gem is a minor release to provide support
for Ruby 1.9 and fix some minor bugs.

## Release Date

November 17, 2010

## In this release

### Features

* The ruby-hl7 gem is now compatible with Ruby 1.9.

### Bug fixes

* The <tt>:diagnostic_serv_sect_id</tt> and <tt>:result_status</tt>
fields (OBR-24 and OBR-25) were missing from the OBR segment.  This had
the effect of shifting the indices associated with later fields by 2.
* The PID-20 field (patient driver's license number) is deprecated.  It
was missing, and as a result, shifted the indices associated with later
fields in the PID segment.

## Known Issues

There are currently no known open issues with the ruby-hl7 gem.
