require 'minitest/autorun'
require 'test/test_helper'

module NanoTest
  class << self
    def failures() @@failures end
    def dots() @@dots end
  end

  # don't autorun
  def at_exit() end
end
require 'nanotest'

# fixture class for nanotest mixin
class Foo
  include NanoTest
end

class TestNanoTest < MiniTest::Unit::TestCase
  def self.test(name, &block)
    define_method("test_#{name.gsub(/\s/,'_')}", &block)
  end

  def teardown
    NanoTest::dots.clear
    NanoTest::failures.clear
  end

  test "api" do
    assert_respond_to Foo.new, :assert
    assert_respond_to NanoTest, :assert
  end

  test "assertion passes" do
    NanoTest.assert { true }
    assert_equal '.', NanoTest::dots.last
    assert_empty NanoTest::failures
  end

  test "assertion fails (false)" do
    NanoTest.assert { false }
    assert_equal 'F', NanoTest::dots.last
    refute_empty NanoTest::failures
  end

  test "assertion fails (nil)" do
    NanoTest.assert { nil }
    assert_equal 'F', NanoTest::dots.last
    refute_empty NanoTest::failures
  end

  test "failure message" do
    @line = __LINE__; NanoTest.assert { false }
    assert_equal 1, NanoTest::failures.size
    assert_includes NanoTest::failures, "(%s:%0.3d) assertion failed" % [__FILE__, @line]
  end

  test "custom failure message, file, line" do
    NanoTest.assert('foo','bar',2) { false }
    assert_includes NanoTest::failures, "(bar:002) foo"
  end

  test "displays results" do
    NanoTest.assert { true }
    NanoTest.assert { false }; line1 = __LINE__
    NanoTest.assert { false }; line2 = __LINE__
    expected = <<-OUT.gsub(/^\s*/,'').strip % [__FILE__, line1, __FILE__, line2]
      .FF
      (%s:%0.3d) assertion failed
      (%s:%0.3d) assertion failed
    OUT
    assert_equal expected, NanoTest.results
  end

  test "displays results with no assertions" do
    assert_empty NanoTest.results.strip
  end
end

