echo "Loading .bash_profile"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# paul: manually add this to the END of the path, so that I still have my system python first
# `conda init` can also add a bunch of things here
export PATH=$PATH:~/miniconda3/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/paczuskp/google-cloud-sdk/path.bash.inc' ]; then . '/Users/paczuskp/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/paczuskp/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/paczuskp/google-cloud-sdk/completion.bash.inc'; fi
