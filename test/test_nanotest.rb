require 'test/test_helper'

class TestNanoTest < MiniTest::Unit::TestCase

  def teardown
    NanoTest::FAILURES.clear
  end

  test "api" do
    class Foo; include NanoTest end
    assert_respond_to Foo.new, :assert
    assert_respond_to NanoTest, :assert
  end

  test "assertion passes" do
    out, err = capture_io do
      NanoTest.assert { true }
    end
    assert_equal '.', out
    assert_empty NanoTest::FAILURES
  end

  test "assertion fails" do
    out, err = capture_io do
      NanoTest.assert { false }
    end
    assert_equal 'F', out
    refute_empty NanoTest::FAILURES
  end

  test "failure message" do
    capture_io do
      @line = __LINE__; NanoTest.assert { false }
    end
    assert_equal 1, NanoTest::FAILURES.size
    assert_includes NanoTest::FAILURES, "(#{__FILE__}:#{@line}) assertion failed"
  end

  test "custom failure message, file, line" do
    capture_io do
      NanoTest.assert('foo','bar',2) { false }
    end
    assert_includes NanoTest::FAILURES, "(bar:2) foo"
  end
end
