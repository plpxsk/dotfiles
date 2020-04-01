echo "Loading .profile"
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

alias be='bundle exec'

alias ll='ls -gho && echo "" && pwd'
alias lll="ls -lh"
alias lld="ls -l | grep 'dr'"
alias lla="ls -al"
alias lls="ls -CF"

alias gits="git status"
alias gitsu="git status --untracked-files=no"
alias gitb="git branch"
alias gitr="git reflog"

function c()
{
 builtin cd "$*" && ls -gho && echo "" && pwd
}

alias b="c ../"
alias bb="c ../.."
alias bbb="c ../../.."

## brew install tree
alias tree="tree -C"

function knit() {
    R -e "rmarkdown::render('$1', 'all')"
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

