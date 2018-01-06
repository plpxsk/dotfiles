Quick Start
===============================================================================
`master` is for my primary box (MacBook Pro). Other branches are for other boxen.

I sometimes also have a non-committed `.profile_private` which I merge in
`.profile`.

Better command-line:

  * `fd` for find
  * `ag` instead of `git grep`
  * `tldr` instead of `man`

(Install instructions below)

# Setting up coding environment on new mac

*NOTE: This guide is a work in progress. Contact me anytime to clarify.*

## Start here

Install Python, jupyter with **miniconda**

Install brew: https://brew.sh

Install brew cask for mac applications (non-cli): https://caskroom.github.io

## brew

	brew install markdown
	brew install tmux
	brew install tree
	brew install git bash-completion

	brew cask install qlstephen

	# https://github.com/sharkdp/fd/
	brew install fd
	
	# the `ag` shortcut
	# https://github.com/ggreer/the_silver_searcher
	brew install the_silver_searcher
	
## Other

install npm in some way. then:


	npm install -g tldr


## Python

Manage Python 2 vs 3 kernels with conda

Default is Python 3

Use Python 2 kernel in Jupyter:
http://ipython.readthedocs.io/en/stable/install/kernel_install.html


## Emacs

	M-x package-install RET my_package_name

Packages to install

  * `exec-path-from-shell`
  * `flycheck`
  * `magit`
  * more in `.emacs`
  
[Run R from SSH session](https://www.r-bloggers.com/run-a-remote-r-session-in-emacs-emacs-ess-r-ssh/)

# Misc

Change Emacs dock icon. Use `Emacs.icns` and
[follow the rest of these instructions](https://apple.stackexchange.com/a/276579).

Safari - Vimtastic https://github.com/guyht/vimari

# References

https://github.com/whomwah/qlstephen

https://github.com/toland/qlmarkdown
