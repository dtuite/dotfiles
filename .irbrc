# Enable irb completion
require "irb/completion"

# Turn on autoindent
IRB.conf[:AUTO_INDENT] = true

# Automcatically load the Hirb gem in the Rails console.
if ENV['RAILS_ENV']
  require 'rubygems'
  require 'hirb'
  Hirb.enable
end

# Save IRB history to file so we can use up arrows to cycle through
# previously typed commands.
require 'irb/ext/save-history'
# History configuration
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
