## Overview

Version 1.0.0 of the ruby-hl7 gem provides better support for HL7 version 2.5.1 and some technical improvements like integration with rspec.
It also includes a number of sample HL7 messages from different sources, notably NIST.

## Release Date

November 30, 2010

## In this release

### Features

* The ruby-hl7 gem provides support for the following new segments:
  * ERR
  * NK1
  * ORC
  * SFT
  * SPM
* The ruby-hl7 gem now supports parsing of HL7 message batches.
* The ruby-hl7 gem now uses rspec 1.3 for unit tests rather than Test::Unit, allowing for BDD-style unit testing.  It has also been
  integrated with the Bundler since release 0.4.0.
* A number of sample HL7 messages from NIST, Cerner and other sources are now available with the gem, both HL7 2.3.1 and 2.5.1.

### Bug fixes

Release 1.0.0 does not address any bugs.

## Known Issues

There are currently no known open issues with the ruby-hl7 gem.
