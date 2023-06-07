## ============================================================================
## zsh  specific
## ============================================================================
# https://stackoverflow.com/a/1438523/3217870
autoload -U select-word-style
select-word-style bash

# git autocomplete is available by default in zsh. replaces bash-completion
autoload -Uz compinit && compinit

## ============================================================================
## load cross-platform dotfiles
## ============================================================================
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# homebrew
eval "$(/usr/local/bin/brew shellenv)"
# Homebrew: Python
export PATH="$(brew --prefix)/opt/python@3/libexec/bin:$PATH"

# https://airflow.apache.org/docs/apache-airflow/stable/start.html
export AIRFLOW_HOME=~/airflow


# Installing collected packages: apache-airflow
#   WARNING: The script airflow is installed in '/Users/paczuskp/Library/Python/3.9/bin' which is not on PATH.
#   Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
# Successfully installed apache-airflow-2.6.1
export PATH="/Users/paczuskp/Library/Python/3.9/bin:$PATH"
