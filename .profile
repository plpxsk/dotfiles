## ============================================================================
## WHAT		bash init file
## AUTHOR       [AMA!] Pawel Paczuski [pavopax.com]  

## CONTENTS (headings in this file)
##   Customizatons
##   Applications    (including application-specific aliases)
##   Utilities
##   Navigation

##   Scratch


## RESOURCES
##   www.alias.sh
##   http://beckism.com/2009/02/better_bash_prompt/
##   GREAT:
##   http://www.ibm.com/developerworks/linux/library/l-tip-prompt/

## NOTES        
##   PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
## ============================================================================

## ============================================================================
## Customizations
## ============================================================================
# prompt
# to see your current prompt, type: echo $PS1
PS1='\[\e[1m\]\W\$ \[\e[0m\]'


## ============================================================================
## Applications
## ============================================================================
#alias emacs="/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs -nw"
# alias em="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias em="emacs"
alias vi="vim"

alias gits="git status --untracked-files=no"
alias gitb="git branch"
alias gitr="git reflog"
#alias gitcam="git commit -am"


## PYTHON
## pip installed in root [sudo] but ipython installed with --user
## so need the below to access `ipython`
#alias ipython="python -m IPython"




## ============================================================================
## Utilities 
## ============================================================================
alias src="source ~/.profile"
alias alter="emacs ~/.profile"

alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder

# deletes emacs backup files and similar
alias cleanem="sh ~/c/init-files/cleanem.sh"

alias pp="pwd"
alias rm="rm -i"
alias lm='less -M'

alias ll='ls -go && echo "" && pwd'
alias lll="ls -l"
alias lld="ls -l | grep 'dr'"
alias lla="ls -al"
alias lls="ls -CF"

## tree installed using 'brew install tree'
alias tree="tree -C"

## set up a directory
alias setupdir="cp -r ~/projects/_template/* ."

# https://coderwall.com/p/be5gga/git-autocompletion-in-os-x-terminal
# source ~/.git-completion.bash

# why wouldn't you have this..
function c()
{
 builtin cd "$*" && ls -go && echo "" && pwd
}

## ============================================================================
## Navigation
## ============================================================================
alias b="c ../"
alias bb="c ../.."
alias bbb="c ../../.."
alias bbbb="c ../../../.."
alias bbbbb="c ../../../../.."


## CUSTOM LOCATIONS
alias icloud="c ~/Library/Mobile Documents/com~apple~CloudDocs"
alias tempo="c ~/tempo"
# pax = /bin/pax, some archiving utility
alias pax="c ~/github/pavopax.github.io"
alias gg="c ~/github"

alias sshdo="ssh vagrant@45.55.49.207" # my box
alias sshdoadmin="ssh vagrant@45.55.51.239" # fellow admin box

alias tdi-icloud="c /Users/pawel/Library/Mobile Documents/com~apple~CloudDocs/projects/tdi-teaching-2017"

alias ssh_spark_20gb="ssh -i ~/.aws/my-key.pem ubuntu@ec2-107-21-74-38.compute-1.amazonaws.com"

## don't remember; possibly  for local [non-sudo] [i]python installation 
# EDIT: I think this is now added by default, so commented-out
# export PATH=/usr/local/bin:$PATH

# PG
# http://postgresapp.com/documentation/cli-tools.html
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
# https://devcenter.heroku.com/articles/heroku-postgresql#local-setup
# PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH:$PATH"

# for testing my heroku web app (TDI)
# original usnews one:
#export DATABASE_URL="postgres://pawel@localhost:5432/wb_indicators" 
export DATABASE_URL="postgres://pawel@localhost:5432/indicators" 


# AWS
# complete -C '/Users/pawel/anaconda/bin/aws_completer' aws

# install Java, scala, spark:
# http://genomegeek.blogspot.com/2014/11/how-to-install-apache-spark-on-mac-os-x.html
export JAVA_HOME=$(/usr/libexec/java_home)
export SCALA_HOME=/usr/local/bin/scala  
export SPARK_HOME=/Users/pawel/spark-1.6.1
export PATH=$PATH:$SCALA_HOME/bin 

alias pyspark="~/spark-1.6.1/bin/pyspark"

export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH

export PATH=$PATH:~/apache-maven-3.3.9/bin

# added by Anaconda2 4.0.0 installer
export PATH="/Users/pawel/anaconda/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/pawel/.sdkman"
[[ -s "/Users/pawel/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/pawel/.sdkman/bin/sdkman-init.sh"
