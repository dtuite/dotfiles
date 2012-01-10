# enable irb completion
require "irb/completion"

# turn on autoindent
IRB.conf[:AUTO_INDENT]=true

if ENV['RAILS_ENV']
  require 'rubygems'
  require 'hirb'
  Hirb.enable
end
