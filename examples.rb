require 'nanotest'
include NanoTest

class Foo
  attr_accessor :a
end

@foo = Foo.new

assert { @foo.is_a?(Foo) }
assert { @foo.respond_to?(:a) }
assert { @foo.a.nil? }

@foo.a  = 'a'
@foo.a << 'b'

assert { @foo.a == 'ab' }

@foo.a = nil

assert { @foo.a == 'a' }
assert('boom') { false }

__END__
output:

....FF
(examples.rb:021) assertion failed
(examples.rb:022) boom
