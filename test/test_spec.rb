require 'nanotest'
require 'nanotest/spec'
require 'test/test_helper'

include  NanoTest

# test: object assertion
'abc'.size.must == 3

# test: class assertion
String.must.respond_to?(:new)

# test: module assertion
Enumerable.must.is_a?(Module)

# test: handles blocks
[1,2,3].must.detect {|i| i == 2 }

# test: negative assertions
[1,2,3].wont.include?(4)

# test: chaining, for great justice
[1,2,3].must.include?(1).
        must.include?(2).
        must.include?(3)

# test: mixed positive/negative assertion chaining
[1,2,3].must.include?(1).
        wont.include?(4)

