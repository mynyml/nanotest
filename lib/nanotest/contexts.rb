module NanoTest
  module Contexts
    extend self

    Context = Struct.new(:setup, :teardown)

    def context(&block)
      @contexts ||= []
      @contexts << Context.new
      instance_eval(&block)
      @contexts.pop
    end

    def setup(&block)
      @contexts.last.setup = block
    end

    def teardown(&block)
      @contexts.last.teardown = block
    end

    def test(&block)
      @contexts.map {|c| c.setup }.compact.each {|s| s.call }
      block.call
      @contexts.map {|c| c.teardown }.compact.each {|s| s.call }
    end
  end
end

