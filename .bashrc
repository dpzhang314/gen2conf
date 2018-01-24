if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
# .bashrc

# User specific aliases and functions

alias rm='rm -rvf'
alias ls='ls -GFh --color'
alias ll='ls -alh --color'
alias less='less -FSRXc'
alias ..='cd ../'
alias cd..='cd ../'
alias ...='cd ../../'
alias ....="cd ../../../../"
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias cp='cp -rf'
alias mv='mv -iv'
alias du='du -lah --max-depth=1'
alias ccache='CCAHCE_DIR=/var/tmp/ccache ccache -s'
alias vi='vim'
alias cls='clear'
alias c='clear'
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias vd='vimdiff'
alias gl='git log --pretty=oneline'
alias gw='git whatchanged --oneline'
alias gs='git status'
alias gd='git diff'
alias gb='git branch'
alias gp='mygrep --colour=auto --exclude=tags --exclude-dir=*.git'

# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

#source /etc/bash_completion.d/git-completion.bash

#git branch show in the shell prompt
find_git_branch () {
	local dir=. head
		until [ "$dir" -ef / ]; do
		if [ -f "$dir/.git/HEAD" ]; then
			head=$(< "$dir/.git/HEAD")
				if [[ $head = ref:\ refs/heads/* ]]; then
								 git_branch=" (${head#*/*/})"
#git_branch=" ? ${head#*/*/}"
					elif [[ $head != '' ]]; then
						git_branch=" ((detached))"
#git_branch=" ? (detached)"
				else
					git_branch=" ((unknow))"
#git_branch=" ? (unknow)"
						fi
						return
						fi
						dir="../$dir"
						done
						git_branch=''
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"

# Here is bash color codes you can use
black=$'\[\e[1;30m\]'
red=$'\[\e[1;31m\]'
green=$'\[\e[1;32m\]'
yellow=$'\[\e[1;33m\]'
blue=$'\[\e[1;34m\]'
magenta=$'\[\e[1;35m\]'
cyan=$'\[\e[1;36m\]'
white=$'\[\e[1;37m\]'
normal=$'\[\e[m\]'

#PS1="$white[$magenta\u$white@$green\h$white:$cyan\W$yellow\$git_branch$white]\$ $normal"
PS1="$white[$magenta\u$white@$green\h$white:$cyan\W$yellow\$git_branch$white]\$ $normal"
#PS1="$red[\W$yellow\$git_branch$red]$ $normal"
complete -cf sudo

# for kernel 4.4.0 gcc 4.8.3
#export PATH=$PATH:/opt/toolschain/usr/local/arm/arm-2014.05/bin

#for arm-linux-gcc 4.5.1 friendlyarm tiny4412
#export PATH=$PATH:/opt/toolschain/usr/local/arm/4.5.1/bin

#for arm-linux-gcc 4.3.2 for mini2440
#export PATH=$PATH:/opt/toolschain/usr/local/arm/4.3.2/bin


# oracle JDK for android studio
#JAVA_HOME=/opt/jdk1.8.0_77
#export JRE_HOME=/opt/jdk1.8.0_77/bin/jre
#export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
#export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

# add for mytools
#export PATH=$PATH:/home/zeroway/Tools


# make normal user can excute the sbin tools
export PATH=$PATH:/sbin:/usr/sbin
