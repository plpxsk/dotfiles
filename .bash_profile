###########################################################################
# gRED Linux Environment Bash Profile
# Version 3.0.0 Released 20171110
###########################################################################

if test -z "$_HOMEBASHRC" ; then 
	# loop detection
	readonly _HOMEBASHRC=true
	test -r $HOME/.bashrc  && . $HOME/.bashrc
fi

echo "Loading .bash_profile"

