# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# I think you can put profile load in .bashrc but NOT .bash_profile
# alias prof='source ~/.profile'

# ... so put them here
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile


