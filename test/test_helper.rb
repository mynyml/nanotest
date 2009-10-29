require 'minitest/autorun'
require 'nanotest'

class MiniTest::Unit::TestCase
  def self.test(name, &block)
    define_method("test_#{name.gsub(/\s/,'_').downcase}", &block)
  end
end
