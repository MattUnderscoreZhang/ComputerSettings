#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# disable autocorrect guesses
unsetopt CORRECT

# remove username from prompt
DEFAULT_USER=`whoami`

# disable ask on delete
unalias rm
setopt rm_star_silent

# don't remove trailing slash on cd commands
setopt no_auto_remove_slash

# iTerm2 plugins (from ~/.iterm2_shell_integration.bash)
alias imgcat=~/.iterm2/imgcat;alias imgls=~/.iterm2/imgls;alias it2attention=~/.iterm2/it2attention;alias it2check=~/.iterm2/it2check;alias it2copy=~/.iterm2/it2copy;alias it2dl=~/.iterm2/it2dl;alias it2getvar=~/.iterm2/it2getvar;alias it2setcolor=~/.iterm2/it2setcolor;alias it2setkeylabel=~/.iterm2/it2setkeylabel;alias it2ul=~/.iterm2/it2ul;alias it2universion=~/.iterm2/it2universion

# tab completion options
zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# single enter for selection
bindkey -M menuselect '^M' .accept-line

# aliases
alias ls='ls -G'
function killjobs () {
    JOBS="$(jobs -p)";
    if [ -n "${JOBS}" ]; then
        kill -KILL ${JOBS};
    fi
}

# fix from matplotlib FAQ about virtual environments
function frameworkpython {
if [[ ! -z "$VIRTUAL_ENV" ]]; then
    #PYTHONHOME=$VIRTUAL_ENV /usr/bin/python2.7 "$@"
    PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
else
    /usr/local/bin/python "$@"
fi
}

# use Homebrew Python and Ruby
PATH="/usr/local/bin:/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# use vim for default editor
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# set nvim as default editor
alias vim=nvim

# add conda environment
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv anaconda root_indicator background_jobs history time)

# C++ flags
export CXXFLAGS="$CXXFLAGS -W -Wall -Werror -pedantic -std=c++14"

# fzf git diff
fd() {
    preview="git diff $@ --color=always -- {-1}"
    git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# make ls always follow cd
function cd() {
    builtin cd "$@"
    ls
}

# set up thefuck
eval $(thefuck --alias)

# use z to search-cd
eval "$(zoxide init zsh)"
function z() {
    __zoxide_z "$@"
    ls
}

# set up lazygit
alias lg=lazygit

# Wasmer
export WASMER_DIR="/Users/matt/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Flutter + Dart
export PATH="$PATH:/Applications/Flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

## pyenv
#eval "$(pyenv init --path)"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#alias py3='pyenv activate py3'

# DSD
alias binarystar='ssh -J simspace@10.40.104.24,simspace@10.40.22.42 simspace@10.10.0.127'
alias purplefor='ssh -J simspace@10.40.104.24,simspace@10.40.22.55 simspace@10.10.210.55'  # out of date
# 10.40.104.24 = orchestrator-dev with internet access
# 10.40.22.42 - simspace-mgmt on binary-star (may have to log on and do "hostname -I" to find the IP)
# 10.10.210.55 - chimera-dev on binary-star
# 10.10.0.127 - redfor on binary-star

# node.js
export PATH="/usr/local/opt/node@16/bin:$PATH"

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
