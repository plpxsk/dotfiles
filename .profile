echo "Loading .profile"
# COMMON PROFILE
# Paul Paczuski 
# https://github.com/pavopax/dotfiles

# ============================================================================
# Link
# ============================================================================
alias pp="pwd"
alias rm="rm -i"
alias lm='less -M'

# for aliases with parameters like $1, need to create functions

ll() {
    ls -lh $1 && echo "" && pwd
}

lld() {
    ls -lh $1 | grep 'dr'
}

alias lla="ls -al"
alias lls="ls -CF"

# use git's aliases (~/.gitconfig)
# alias gits="git status"
# alias gitsu="git status --untracked-files=no"

c() {
 builtin cd "$*" && ll
}

alias b="c ../"
alias bb="c ../.."
alias bbb="c ../../.."

## brew install tree
alias tree="tree -C"

function knit() {
    R -e "rmarkdown::render('$1', 'all')"
}

function count() {
    # usage: count 4 file.csv
    # shows count of nth field in file
    cut -f $1 -d , $2 | sort | uniq -c
}

function hdrs() {
    # usage hdrs file.csv
    # number the columns from header, for use with count()
    head -n 1 $1 | tr ',' '\n' | nl
}

# ============================================================================
# Load
# ============================================================================

# local settings (checkout from different git branch)
if [ -f ~/.profile_local ]; then
    . ~/.profile_local
fi

# private items
if [ -f ~/.profile_private ]; then
    . ~/.profile_private
fi

# color output
# works in multiple shells
export CLICOLOR=1

. "$HOME/.cargo/env"
