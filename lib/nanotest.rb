module Nanotest
  extend self

  @@failures, @@dots = [], []

  def assert(msg=nil, file=nil, line=nil, stack=caller, &block)
    unless block.call
      f,l = stack.first.match(/(.*):(\d+)/)[1..2]
      @@failures << "(%s:%0.3d) %s" % [file || f, line || l, msg || "assertion failed"]
      @@dots << 'F'
    else
      @@dots << '.'
    end
  end

  def self.results #:nodoc:
    @@dots.join + "\n" + @@failures.join("\n")
  end

  at_exit { puts results unless results.strip.empty? }
end
