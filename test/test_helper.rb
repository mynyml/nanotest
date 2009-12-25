require 'minitest/autorun'
require 'nanotest'
begin
  require 'redgreen'
  require 'phocus'
  require 'ruby-debug'
rescue LoadError, RuntimeError
end

class MiniTest::Unit::TestCase
  def self.test(name, &block)
    define_method("test_#{name.gsub(/\s/,'_').downcase}", &block)
  end
end
