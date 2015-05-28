## ============================================================================
## WHAT		bash init file
## HOW          
## AUTHOR       [AMA!] Pawel Paczuski [pavopax.com]  

## RESOURCES
## www.alias.sh
## http://beckism.com/2009/02/better_bash_prompt/
## GREAT:
## http://www.ibm.com/developerworks/linux/library/l-tip-prompt/

## NOTES        
## PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
## ============================================================================

# emacs and vi aliases
#alias emacs="/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs -nw"
alias em="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias vi="vim"

# customize prompt
# to see current (this is mac default!):
# echo $PS1
PS1='\[\e[1m\]\W\$ \[\e[0m\]'


# why wouldn't you have this..
function c()
{
 builtin cd "$*" && ls && echo "" && pwd
}


function mcd() {
  mkdir -p "$1" && cd "$1";
}

# also create intermediate directories
alias mkdir="mkdir -p"

alias rm="rm -i"
alias pp="pwd"
alias tempo="c ~/tempo"
alias lm='less -M'

alias src="source ~/.profile"

alias cleanem="sh ~/c/init-files/cleanem.sh"

alias ll='ls -go && echo "" && pwd'
alias lll="ls -l"
alias lld="ls -l | grep 'dr'"
alias lla="ls -al"

alias b="c ../"
alias bb="c ../.."
alias bbb="c ../../.."
alias bbbb="c ../../../.."
alias bbbbb="c ../../../../.."


## tree installed using 'brew install tree'
alias tree="tree -C"

## general aliases
alias gits="git status"

alias alter="emacs ~/.profile"

# pawel custom direcotry aliases
# pax = /bin/pax, some archiving utility
alias pax="c ~/github/pavopax.github.io"
alias bdf="c ~/projects/BDF/bdf-site"
alias gg="c ~/github"
alias msd="c ~/github/msd2015"

alias 98d="c ~/Tresors/cbar/98-DESIGN/R/programs/"
alias nwcs="c ~/Tresors/cbar-secure/376/pawel-analysis"


################################################################################
## scratch

# function ll()
# {
#     builtin ls -go "$*" && echo "" && pwd
# }

# function ll()
# {
#     /usr/bin/ls "$*" -go && echo "" && pwd
# }





export PATH=/usr/local/bin:$PATH
