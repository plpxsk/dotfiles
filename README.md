Quick Start
===============================================================================
`master` is for my primary box (MacBook Pro). Other branches are for other
boxen.

I sometimes also have a non-committed `.profile_private` which I merge in
`.profile`.

# Better command-line tools

  * `tldr` instead of `man` 
  * `fd` to find files
  * `ag` to search file contents

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

# Make touchbar usable

![touchbar](touchbar.jpg)

Requires [Better Touch Tool](https://boastr.net).

My custom configuration is saved in `touchbar-preset.json` (can import to BTT),
and is based on:

1. Great instructions here:
   [vas3k.com/blog/touchbar/](http://vas3k.com/blog/touchbar/)
2. `Fn` key customizations from "You can still access the control strip" at
   [alexw.me/2017/01/what-if-you-could-customize-your-new-touch-bar/](https://alexw.me/2017/01/what-if-you-could-customize-your-new-touch-bar/)

# Misc

Change Emacs dock icon. Use `Emacs.icns` and [follow the rest of these
instructions](https://apple.stackexchange.com/a/276579).

Safari - Vimtastic https://github.com/guyht/vimari

# References

https://github.com/whomwah/qlstephen

https://github.com/toland/qlmarkdown
