# must be loaded after test frameworks, since redgreen and phocus will both
# try to detect them
begin
  require 'redgreen'
  require 'phocus'
rescue LoadError, RuntimeError
end
