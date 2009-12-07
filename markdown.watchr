#!/usr/bin/env watchr

require 'pathname'
require 'rdiscount'
# --------------------------------------------------
# Helpers
# --------------------------------------------------
class ::String
  def md2html
    RDiscount.new(self).to_html
  end
  def save_as(path)
    Pathname(path).open('w') {|f| f << self }
  end
end

default_action do
  md   = Pathname('README.md').expand_path
  html = Pathname('doc/README.html').expand_path

  puts "Translating #{md.basename} (file://#{html})"
  md.read.md2html.save_as(html)
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch( '^README\.md' )

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') { default_action.call }

# Ctrl-C
Signal.trap('INT') { abort("\n") }

