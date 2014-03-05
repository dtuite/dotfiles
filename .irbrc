# Enable irb completion
require "irb/completion"

# Turn on autoindent
IRB.conf[:AUTO_INDENT] = true

ARGV.concat [ "--readline",
              "--prompt-mode",
              "simple" ]


# Save IRB history to file so we can use up arrows to cycle through
# previously typed commands.
require 'irb/ext/save-history'
# History configuration
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
