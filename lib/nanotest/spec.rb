require 'nanotest'

module NanoTest
  class Spec
    instance_methods.each {|m| undef_method(m) unless m.match(/^__|object_id/) }

    def initialize(obj, positive=true)
      @obj, @positive = obj, positive
    end

    def method_missing(method, *args, &block)
      file, line = caller.first.split(':')[0..1]
      bool = @obj.__send__(method, *args, &block)
      bool = !bool unless @positive
      NanoTest.assert("assertion failed", file, line) { bool }
      @obj
    end
  end
end

class Object
  def must
    NanoTest::Spec.new(self)
  end
  def wont
    NanoTest::Spec.new(self, false)
  end
end

