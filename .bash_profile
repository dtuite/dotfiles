# needed to make postgreSQL work on Lion
export PATH=/usr/local/bin:$PATH
#PATH=$PATH:'/usr/local/bin'

# THis is a folder for personal stuff I want in $PATH
export PATH=~/bin:$PATH

# to include MacVIM in my path
PATH=$PATH:'/Applications/Dev Stuff/MacVim.app'

# android SDK
export PATH=${PATH}:~/wd/android/android-sdk-mac_x86/tools:~/wd/android/android-sdk-mac_x86/platform-tools

# to make git autocomplete work
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Read aliases from a separate file.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

##########################################
### PROMPT STYLING
##########################################

# to add colour, see: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
# \d Date. \h Host. \n Newline. \t Time. \u Username. \W cirrent dir. \w Full path

# relative path only
# PS1='\[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# relative path, git info
# PS1='\[\e[1;34m\]\W\[\e[m\] \[\e[00;33m\]$(vcprompt)\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# rvm info, relative path, git info
# PS1='\[\e[00;36m\]$(~/.rvm/bin/rvm-prompt)\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[00;33m\]$(vcprompt)\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# rvm info, git info, relative path
PS1='\[\e[00;36m\]$(~/.rvm/bin/rvm-prompt)\[\e[m\] \[\e[00;35m\]$(vcprompt)\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# print_before_the_prompt(){
#    echo 'this is here'
#  }
#PROMPT_COMMAND=print_before_the_prompt


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
