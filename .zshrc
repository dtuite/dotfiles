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
plugins=(git git-flow)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/sbin

# android SDK
export PATH=${PATH}:~/dev/mobile_development/android_sdk-21.0.1/tools:~/dev/mobile_development/android_sdk-21.0.1/platform-tools

# Get go executables in path
export PATH=$PATH:~/bin:/usr/local/go/bin

# Get node modules in path
export PATH=$PATH:/usr/local/share/npm/bin

# Autocomplete settings
# autoload -U compinit promptinit
#compinit
#promptinit

# Turn off auto-spelling-correction
setopt nocorrectall

# Don't correct the following commands
alias thin='nocorrect thin'
alias guard='nocorrect guard'

# Read alises from a separate file.
source $HOME/.aliases

# Init the z directory jumper
# . `brew --prefix`/etc/profile.d/z.sh
# function precmd () {
#   z --add "$(pwd -P)"
# }

# Prevent Git from opening a Vim session for every merge message.
export GIT_MERGE_AUTOEDIT=no

# Instantiate rbenv with your shell
eval "$(rbenv init -)"
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem
