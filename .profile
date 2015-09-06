## ============================================================================
## WHAT		bash init file
## AUTHOR       [AMA!] Pawel Paczuski [pavopax.com]  

## CONTENTS (headings in this file)
##   Customizatons
##   Applications    (including application-specific aliases)
##   Utilities
##   Navigation

##   Scratch


## RESOURCES
##   www.alias.sh
##   http://beckism.com/2009/02/better_bash_prompt/
##   GREAT:
##   http://www.ibm.com/developerworks/linux/library/l-tip-prompt/

## NOTES        
##   PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
## ============================================================================

## ============================================================================
## Customizations
## ============================================================================
# prompt
# to see your current prompt, type:
# echo $PS1
PS1='\[\e[1m\]\W\$ \[\e[0m\]'



## ============================================================================
## Applications
## ============================================================================
#alias emacs="/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs -nw"
# alias em="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias em="emacs"
alias vi="vim"

alias gits="git status"
alias gitb="git branch"

## ============================================================================
## Utilities 
## ============================================================================
alias src="source ~/.profile"
alias alter="emacs ~/.profile"

# deletes emacs backup files and similar
alias cleanem="sh ~/c/init-files/cleanem.sh"

alias pp="pwd"
alias rm="rm -i"
alias lm='less -M'

alias ll='ls -go && echo "" && pwd'
alias lll="ls -l"
alias lld="ls -l | grep 'dr'"
alias lla="ls -al"

## tree installed using 'brew install tree'
alias tree="tree -C"

## set up a directory
alias setupdir="cp -r ~/projects/_template/* ."


# why wouldn't you have this..
function c()
{
 builtin cd "$*" && ls -go && echo "" && pwd
}

## ============================================================================
## Navigation
## ============================================================================
alias b="c ../"
alias bb="c ../.."
alias bbb="c ../../.."
alias bbbb="c ../../../.."
alias bbbbb="c ../../../../.."


## CUSTOM LOCATIONS
alias tempo="c ~/tempo"
# pax = /bin/pax, some archiving utility
alias pax="c ~/github/pavopax.github.io"
alias gg="c ~/github"
alias msd="c ~/github/msd2015"





## ============================================================================
## Scratch
## ============================================================================


# function ll()
# {
#     builtin ls -go "$*" && echo "" && pwd
# }

# function ll()
# {
#     /usr/bin/ls "$*" -go && echo "" && pwd
# }


# function mcd() {
#   mkdir -p "$1" && cd "$1";
# }

# also create intermediate directories
# alias mkdir="mkdir -p"


## don't remember:
export PATH=/usr/local/bin:$PATH
