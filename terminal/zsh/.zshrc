#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Disable autocorrect guesses
unsetopt CORRECT

# Remove username from prompt
DEFAULT_USER=`whoami`

# Disable ask on delete
unalias rm
setopt rm_star_silent

# Don't remove trailing slash on cd commands
setopt no_auto_remove_slash

# iTerm2 plugins (from ~/.iterm2_shell_integration.bash)
alias imgcat=~/.iterm2/imgcat;alias imgls=~/.iterm2/imgls;alias it2attention=~/.iterm2/it2attention;alias it2check=~/.iterm2/it2check;alias it2copy=~/.iterm2/it2copy;alias it2dl=~/.iterm2/it2dl;alias it2getvar=~/.iterm2/it2getvar;alias it2setcolor=~/.iterm2/it2setcolor;alias it2setkeylabel=~/.iterm2/it2setkeylabel;alias it2ul=~/.iterm2/it2ul;alias it2universion=~/.iterm2/it2universion

# Tab completion options
zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# single enter for selection
bindkey -M menuselect '^M' .accept-line

# Start on desktop
cd ~/Desktop

# Aliases
export RUCIO_ACCOUNT=mazhang
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias ls='ls -G'
function bm() {
    if  [ ! -e ~/.cd_bookmarks ] ; then
        mkdir ~/.cd_bookmarks
    fi
    # create bookmark
    echo "cd \"`pwd`\"" >| ~/.cd_bookmarks/"$1" ;
}
function cd() {
    if [ -f ~/.cd_bookmarks/"$1" ] ; then
        source ~/.cd_bookmarks/"$1"
    else
        builtin cd "$@"
        ls
    fi
}
function killjobs () {
    JOBS="$(jobs -p)";
    if [ -n "${JOBS}" ]; then
        kill -KILL ${JOBS};
    fi
}

# Python settings
# Fix from matplotlib FAQ about virtual environments
function frameworkpython {
if [[ ! -z "$VIRTUAL_ENV" ]]; then
    #PYTHONHOME=$VIRTUAL_ENV /usr/bin/python2.7 "$@"
    PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
else
    /usr/local/bin/python "$@"
fi
}
# Python virtual environments
alias kernel2='source ~/py2_kernel/bin/activate'
alias kernel3='source ~/py3_kernel/bin/activate'
# Use Homebrew Python and Ruby
PATH="/usr/local/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
## Virtual python environments
#VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
#source /usr/local/bin/virtualenvwrapper.sh

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# add conda environment
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv anaconda root_indicator background_jobs history time)

# C++ flags
export CXXFLAGS = "$CXXFLAGS -W -Wall -Werror -pedantic -std=c++14"
