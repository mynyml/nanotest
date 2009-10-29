# Run me with:
#
#   $ watchr gem.watchr
#
# Manifest file can be automatically generated with:
# 
#   $ cat .git/hooks/post-commit
#   #!bin/sh
#   git ls-files > Manifest
#

# --------------------------------------------------
# Helpers
# --------------------------------------------------
def build
  system "rake -s gem"; puts
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch( '^Rakefile$' ) { build }
watch( '^Manifest$' ) { build }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Building Gem ---\n\n"
  build
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }

