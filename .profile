# COMMON PROFILE
# Paul Paczuski 
# https://github.com/pavopax/initialization-files

# ============================================================================
# Link
# ============================================================================
alias pp="pwd"
alias rm="rm -i"
alias lm='less -M'

alias f='open -a Finder ./'                 # macOS only

alias ll='ls -go && echo "" && pwd'
alias lll="ls -l"
alias lld="ls -l | grep 'dr'"
alias lla="ls -al"
alias lls="ls -CF"

function c()
{
 builtin cd "$*" && ls -go && echo "" && pwd
}

alias b="c ../"
alias bb="c ../.."
alias bbb="c ../../.."
alias bbbb="c ../../../.."
alias bbbbb="c ../../../../.."

alias gits="git status --untracked-files=no"
alias gitb="git branch"
alias gitr="git reflog"

## brew install tree
alias tree="tree -C"

alias juno="jupyter notebook &"


# ============================================================================
# Load
# ============================================================================
# brew install git bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# local settings (checkout from different git branch)
if [ -f ~/.profile_local ]; then
    . ~/.profile_local
fi

# private items
if [ -f ~/.profile_private ]; then
    . ~/.profile_private
fi

# color output
export CLICOLOR=1
