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

# use Homebrew Python
PATH="/usr/local/bin:/usr/local/Cellar/python@3.11/3.11.2_1/bin/${PATH}"
export PATH
alias python=python3
alias pip=pip3

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

# poetry
alias poetry='~/Library/Application\ Support/pypoetry/venv/bin/poetry'

# DSD
alias binarystar='ssh -J simspace@10.40.104.24,simspace@10.40.20.35 simspace@10.10.210.55'
alias purplefor='ssh -J simspace@10.40.104.24,simspace@10.40.22.55 simspace@10.10.210.55'

# node.js
export PATH="/usr/local/Cellar/node/19.7.0/bin:$PATH"

# add GCloud components
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

alias gpt_assist='python ~/Projects/gpt_assist/main.py'

# PEP 582 for pdm
if [ -n "$PYTHONPATH" ]; then
    export PYTHONPATH='/usr/local/Cellar/pdm/2.4.9/libexec/lib/python3.11/site-packages/pdm/pep582':$PYTHONPATH
else
    export PYTHONPATH='/usr/local/Cellar/pdm/2.4.9/libexec/lib/python3.11/site-packages/pdm/pep582'
fi
