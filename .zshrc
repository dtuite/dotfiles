# This will set the default prompt to the walters theme
# prompt walters
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="afowler"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Don't share history between iTerm2 tabs.
# http://apple.stackexchange.com/a/75572/4983
unsetopt inc_append_history
unsetopt share_history

# The PATH
# NOTE: The first entry must not have "${PATH}". If it does then sourcing
# this file will just continuously concatenate onto the end of the $PATH
# rather than writing it from scratch.

# Homebrew installed stuff
export PATH=/usr/local/bin
export PATH=${PATH}:/usr/bin
export PATH=${PATH}:/bin
export PATH=${PATH}:/usr/sbin
export PATH=${PATH}:/sbin
export PATH=${PATH}:/usr/X11/bin
export PATH=${PATH}:/usr/local/sbin
# Scripts I wrote myself.
export PATH=${PATH}:$HOME/bin
# Stuff installed by the python package manager "pip"
export PATH=${PATH}:$HOME/Library/Python/2.7/bin
# Added by the Heroku Toolbelt
export PATH=${PATH}:/usr/local/heroku/bin


export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export ANDROID_HOME=/usr/local/opt/android-sdk

# Prevent pushing LegitScript gems to Rubygems.
# https://team.legitscript.com/our-very-own-gem-server/
export RUBYGEMS_HOST=https://gems.legitscript.com

# Fix tmux Vim colours.
# http://askubuntu.com/a/133623/100609
export TERM="xterm-256color"

# Autocomplete settings
# autoload -U compinit promptinit
#compinit
#promptinit

# Turn off auto-spelling-correction
setopt nocorrectall

# Read alises from a separate file.
source $HOME/.aliases

# Prevent Git from opening a Vim session for every merge message.
export GIT_MERGE_AUTOEDIT=no

# Instantiate rbenv with your shell
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# Fix the "ruby read server certificate B: certificate verify failed" SSL error.
# INFO: http://railsapps.github.io/openssl-certificate-verify-failed.html#comment-657918573
# export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem

# Update oh-my-zsh without prompting.
DISABLE_UPDATE_PROMPT=true

export EDITOR="/usr/local/bin/vim"

# Golang

# This is where all my go code lives.
export GOPATH=$HOME/dev/gocode
# This is where my own binaries live
export PATH=${PATH}:$HOME/dev/gocode/bin
# This is where godoc and gofmt live.
export PATH=${PATH}:/usr/local/opt/go/libexec/bin

# Node

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Haskell

# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
