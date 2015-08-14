# Instantiate rbenv with your shell
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# Node
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
