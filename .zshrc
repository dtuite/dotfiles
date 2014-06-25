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

# Customize to your needs...

# Homebrew installed stuff
export PATH=${PATH}:/usr/local/bin
export PATH=${PATH}:/usr/bin
export PATH=${PATH}:/bin
export PATH=${PATH}:/usr/sbin
export PATH=${PATH}:/sbin
export PATH=${PATH}:/usr/X11/bin
export PATH=${PATH}:/usr/local/sbin
# Scripts I wrote myself.
export PATH=${PATH}:/Users/davidtuite/bin
# Stuff installed by the python package manager "pip"
export PATH=${PATH}:/Users/davidtuite/Library/Python/2.7/bin
# Added by the Heroku Toolbelt
export PATH=${PATH}:/usr/local/heroku/bin

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
export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem

# Update oh-my-zsh without prompting.
DISABLE_UPDATE_PROMPT=true

export EDITOR="/usr/local/bin/vim"
