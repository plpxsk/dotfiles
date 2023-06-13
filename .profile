echo "Loading .profile"
# COMMON PROFILE
# Paul Paczuski 
# https://github.com/plpxsk/dotfiles

# ============================================================================
# Link
# ============================================================================
alias pp="pwd"
alias rm="rm -i"
alias lm='less -M'

alias ll='ls -gho && echo "" && pwd'
alias lll="ls -lh"
alias lld="ls -l | grep 'dr'"
alias lla="ls -al"
alias lls="ls -CF"

function c()
{
 builtin cd "$*" && ls -gho && echo "" && pwd
}

alias b="c ../"
alias bb="c ../.."
alias bbb="c ../../.."

alias treec="tree -C"

function knit() {
    R -e "rmarkdown::render('$1', 'all')"
}

function cutx() {
    # usage: cutx 8 file.csv
    cut -f $1 -d , $2
}

function count() {
    # usage: count 4 file.csv
    # shows count of nth field in file
    cut -f $1 -d , $2 | sort | uniq -c
}

function hdrs() {
    # usage: hdrs file.csv
    # number the columns from header, for use with count()
    head -n 1 $1 | tr ',' '\n' | nl
}

function tabit() {
    # usage: tabit file.csv | head
    # usage: cutx 5-8 file.csv | tabit | head
    column -s, -t $1
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
export CLICOLOR=1
