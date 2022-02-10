PROMPT='%B%1~#%b '

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/paczuskp/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/paczuskp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/paczuskp/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/paczuskp/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(_RSCONNECT_COMPLETE=source_zsh rsconnect)"
