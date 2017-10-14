Quick Start
===============================================================================
This repository stores my (mostly) up-to-date initialization files.

I maintain a few branches for my boxen.

# Setting up coding environment on new mac

## Start here

Install Python, jupyter with **miniconda**

Install brew: https://brew.sh

Install brew cask for mac apps: https://caskroom.github.io

## brew

	brew install markdown
	brew install tmux
	brew install tree
	
	brew cask install qlstephen

	# https://github.com/sharkdp/fd/
	brew install fd


## Python

Manage Python 2 vs 3 kernels with conda

Default is Python 3

Use Python 2 kernel in Jupyter: http://ipython.readthedocs.io/en/stable/install/kernel_install.html


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

# References

https://github.com/whomwah/qlstephen

https://github.com/toland/qlmarkdown
