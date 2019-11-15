[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# paul: manually add this to the END of the path, so that I still have my system python first
# `conda init` can also add a bunch of things here
export PATH=$PATH:~/miniconda3/bin
