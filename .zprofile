echo "Loading .zprofile"

## ============================================================================
## zsh  specific
## ============================================================================
# https://stackoverflow.com/a/1438523/3217870
autoload -U select-word-style
select-word-style bash

# git autocomplete is available by default in zsh. replaces bash-completion
autoload -Uz compinit && compinit


## ============================================================================
## global shell
## ============================================================================
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile


# paul: manually add this to the END of the path, so that I still have my system python first
# `conda init` can also add a bunch of things here
# export PATH=$PATH:~/miniconda3/bin
