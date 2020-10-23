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
