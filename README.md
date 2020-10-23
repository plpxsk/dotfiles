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

# Setting up coding environment on new Mac

*NOTE: This guide is a work in progress.*

On macOS Terminal, new shell runs dotfiles in this order, per current setup:

	.zprofile (manually loads .profile
	.profile (manually loads .profile_local)
	.profile_local
	.zshrc
	
## Start here

Install brew: https://brew.sh

Install brew cask for mac applications (non-cli): https://caskroom.github.io

Install Python with brew

## brew

	brew install markdown pandoc
	brew install tmux
	brew install tree
	brew install git bash-completion

	brew cask install qlstephen

	# https://github.com/sharkdp/fd/
	brew install fd
	
	# the `ag` shortcut
	# https://github.com/ggreer/the_silver_searcher
	brew install the_silver_searcher

	brew install tldr
	
	# inconsolata font
	brew tap homebrew/cask-fonts                  # you only have to do this once!
	brew cask install font-inconsolata
	
## Other

Install npm in some way. then:


	npm install -g tldr


## Tmux

First, install plug in manager: https://github.com/tmux-plugins/tpm

Then install tmux resurrect, etc

## Python

Manage Python 2 vs 3 kernels with conda

Default is Python 3

Use Python 2 kernel in Jupyter:
http://ipython.readthedocs.io/en/stable/install/kernel_install.html


## R

Install R including CLI.

## Emacs

!! macOS Catalina Problems: spotlight switching and desktop file access. Resolve:

1. Install from https://emacsformacosx.com
1. Then OPEN emacs for the first time, to overcome the "unsigned package" dialog and so that next steps work. Otherwise you may get a "Emacs package is corrupted" or similar error..
1. Carefully rename some files inside the package contents

  * mv the `*_10` not the `*_14` binary (on my setup)
  * See [this link](https://spin.atomicobject.com/2019/12/12/fixing-emacs-macos-catalina/)

1. Now, you can try opening desktop files. Maybe it will prompt for access. If not, go into macOS security and privacy settings per above link and add disk access for Emacs

Start with `.emacs` (from `.emacs.lite`) then install packages from
`.emacs.d/.emacs.local` as needed.

	M-x package-install RET my_package_name

Packages to install

  * `exec-path-from-shell`
  * `flycheck`
  * `magit`
  * more in `.emacs`
  
[Run R from SSH session](https://www.r-bloggers.com/run-a-remote-r-session-in-emacs-emacs-ess-r-ssh/)

### ESS for Emacs

1. Download zip
1. Move to .emacs.d
1. Source in .emacs.local




# Improving touchbar 

*Note: recently disabled, didn't find it too useful.*

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
