# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
