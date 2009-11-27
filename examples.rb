require 'nanotest'
include  Nanotest

class Foo
  attr_accessor :bar
end

@foo = Foo.new

assert { @foo.is_a?(Foo) }
assert { @foo.respond_to?(:bar) }
assert { @foo.bar.nil? }

@foo.bar  = 'a'
@foo.bar << 'b'

assert {     @foo.bar == 'ab' }
assert { not @foo.bar == 'xy' }

@foo.bar = nil

assert { @foo.bar == 'ab' }
assert('boom') { false }

__END__
output:

.....FF
(examples.rb:021) assertion failed
(examples.rb:022) boom

