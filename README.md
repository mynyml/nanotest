*"Frustra fit per plura quod potest fieri per pauciora."* --William of Ockham  
"It is futile to do with more things that which can be done with fewer."

### Summary

Extremely minimal test framework. Perfect for DIY lovers. Nanotest provides
the bare minimum needed; for everything else, there's ruby.

### Install

    gem install nanotest

### Examples

    require 'nanotest'
    include  Nanotest

    assert {     1 == 1 }
    assert {     2  > 1 }
    assert { not 1  > 2 }
    assert {     1 == 2 } #line 12

    outputs:

    ...F
    (examples.rb:012) assertion failed

See actual use at <http://github.com/mynyml/phocus/blob/master/test/test_phocus.rb>

### API

Nanotest has a single method: `#assert`. You can either include Nanotest as
above, or use its method directly: `Nanotest.assert { true }`. Its block is
expected to return a boolean. If it's false it fails, otherwise it passes.
Simple as that.

`#assert` also accepts a custom failure message:

    assert("foo is too small") { @foo > 5 } #line 36
    #=> (examples.rb:036) foo is too small

That's pretty much it. Maximum Simplicity. If you insist on doing something
fancy, check out the wiki for a few tips and tricks.

### Stats

    $ rake -s loc
    lib contains 17 SLOCs

### See Also

* [nanotest/extensions][1]
* [redgreen][2]
* [RR][3]

### Links

* code: <http://github.com/mynyml/nanotest>
* docs: <http://rdoc.info/projects/mynyml/nanotest>
* wiki: <http://wiki.github.com/mynyml/nanotest>
* bugs: <http://github.com/mynyml/nanotest/issues>


[1]: http://github.com/mynyml/nanotest_extensions
[2]: http://github.com/mynyml/redgreen
[3]: http://github.com/btakita/rr
