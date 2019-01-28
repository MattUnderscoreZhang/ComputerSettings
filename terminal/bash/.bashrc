if [ -z "$PS1" ]; then
    return;
fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
color_prompt=yes

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color) color_prompt=yes;;
# esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# my stuff
export RUCIO_ACCOUNT=mazhang
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias ls='ls -G'
alias notes='vim ~/Dropbox/Work\ Journal/`date +%Y-%m-%d`.txt'
alias work='vim ~/Dropbox/Work\ Journal/Work\ Tasks.txt'
alias points='vim ~/Dropbox/Work\ Journal/Points.cxx'
#alias python='python3'
#alias pip=pip3
alias memory='vim /Users/mattzhang/Google\ Drive/Projects/Memory/memories.txt'
cd ~/Desktop
. /Applications/root_v6.06.02/bin/thisroot.sh
cd() {
    if [[ $@ == "work" ]]
    then
        command cd "/Users/mattzhang/Dropbox/Research/"
        ls
    elif [[ $@ == "notebooks" ]]
    then
        command cd "/Users/mattzhang/Dropbox/Research/Notebooks/"
        ls
    elif [[ $@ == "projects" ]]
    then
        command cd "/Users/mattzhang/Projects/"
        ls
    elif [[ $@ == "git" ]]
    then
        command cd "/Users/mattzhang/Dropbox/Research/Git/"
        ls
    else
        command cd "$@"
        ls
    fi
}
# PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$"
# PS1="\[\e[1;31m\]\w 🍥  \[\033[0m\]"

##########################################
# Modified from http://www.buoydontfloat.com/bash/h4x0r/2016/07/09/bash-emojis.html
##########################################

BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
LIME_YELLOW="\[$(tput setaf 190)\]"
YELLOW="\[$(tput setaf 3)\]"
POWDER_BLUE="\[$(tput setaf 153)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
BRIGHT="\[$(tput bold)\]"
NORMAL="\[$(tput sgr0)\]"
BLINK="\[$(tput blink)\]"
REVERSE="\[$(tput smso)\]"
UNDERLINE="\[$(tput smul)\]"

############################################
# Modified from emilis bash prompt script
# from https://github.com/emilis/emilis-config/blob/master/.bash_ps1
#
# Modified for Mac OS X by
# @corndogcomputer
###########################################
# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):
fill="--- "
reset_style='\[\033[00m\]'
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
prompt_style=$reset_style
command_style=$reset_style'\[\033[1;29m\]' # bold black
# Prompt variable:
emoji() {
    echo -e "\xf0\x9f\x8d\x95  " # fixes damn line-wrap issue 🍕
}
PS1="$status_style"'$fill \t\n'"\[\e[1;31m\]\w $(emoji) \[\033[0m\]${RED}"
#PS1="$status_style"'$fill \t\n'"\[\e[1;31m\]\w € \[\033[0m\]"
# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG
function prompt_command {
    # create a $fill of all screen width minus the time string and a space:
    let fillsize=${COLUMNS}-9
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="-${fill}" # fill with underscores to work on
        let fillsize=${fillsize}-1
    done
    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
        xterm*|rxvt*)
            bname=`basename "${PWD/$HOME/~}"`
            echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
            ;;
        *)
            ;;
    esac
}
PROMPT_COMMAND=prompt_command

function nametab() {
    TITLE=$*;
    export PROMPT_COMMAND='echo -ne "\033]0;$TITLE\007"'
}

function killjobs () {
    JOBS="$(jobs -p)";
    if [ -n "${JOBS}" ]; then
        kill -KILL ${JOBS};
    fi
}

# message too long fix
if [ ${TERM} != "dumb" ]; then
     test -s ~/.bashrc-local && . ~/.bashrc-local
 fi

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
#export PATH
#PYTHONPATH="/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7:${PYTHONPATH}"
#export PYTHONPATH

# Python fix from matplotlib FAQ about virtual environments
function frameworkpython {
if [[ ! -z "$VIRTUAL_ENV" ]]; then
    #PYTHONHOME=$VIRTUAL_ENV /usr/bin/python2.7 "$@"
	PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
else
	/usr/local/bin/python "$@"
fi
}

# Python virtual environments
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#source /Library/Frameworks/Python.framework/Versions/3.5/bin/virtualenvwrapper.sh
alias kernel2='source ~/py2_kernel/bin/activate'
alias kernel3='source ~/py3_kernel/bin/activate'
#alias ocv='source ~/.virtualenvs/ocv/bin/frameworkpython'
alias ocv='source ~/.virtualenvs/ocv/bin/activate'
#alias python=frameworkpython

function selfcontrol() {
	defaults write org.eyebeam.SelfControl MaxBlockLength -int 10080
	defaults write org.eyebeam.SelfControl BlockLengthInterval -int 720
}

source ~/.todo
