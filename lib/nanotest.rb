module NanoTest
  extend self

  FAILURES = []

  def assert(msg="assertion failed",file=nil,line=nil,&block)
    if block.call == false
      file ||= caller.first.split(':')[0]
      line ||= caller.first.split(':')[1]
      FAILURES << "(%s:%0.3d) %s" % [file,line,msg]
      print 'F'
    else
      print '.'
    end
  end

  at_exit { puts; FAILURES.each {|f| puts f } }
end
