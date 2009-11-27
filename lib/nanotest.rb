module Nanotest
  extend self

  @@failures, @@dots = [], []

  def assert(msg=nil, file=nil, line=nil, &block)
    unless block.call
      file ||= caller.first.split(':')[0]
      line ||= caller.first.split(':')[1]
      @@failures << "(%s:%0.3d) %s" % [file, line, msg || "assertion failed"]
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
