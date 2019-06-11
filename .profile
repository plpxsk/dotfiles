# COMMON PROFILE
# Paul Paczuski 
# https://github.com/pavopax/dotfiles

# ============================================================================
# Link
# ============================================================================
alias pp="pwd"
alias rm="rm -i"
alias lm='less -M'

alias f='open -a Finder ./'                 # macOS only

alias ll='ls -hgo && echo "" && pwd'
alias lll="ls -lh"
alias lld="ls -lh | grep 'dr'"
alias lla="ls -alh"
alias lls="ls -CFh"

function c()
{
 builtin cd "$*" && ls -go && echo "" && pwd
}

alias b="c ../"
alias bb="c ../.."
alias bbb="c ../../.."

## brew install tree
alias tree="tree -C"

alias juno="jupyter notebook &"

function knit() {
    R -e "rmarkdown::render('$1')"
}

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
