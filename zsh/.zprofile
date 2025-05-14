#
# Runs for login shell (first shell opened in terminal), from which new tabs and panels inherit properties
# Run order: .zshenv, .zprofile, .zpreztorc (called via Prezto inside .zprofile), .zshrc
#

########
# PATH #
########

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
    /usr/local/{bin,sbin}
    $path
)

# Use Homebrew Python 3 by default
PATH="/usr/local/bin:/usr/local/Cellar/python@3.11/3.11.2_1/bin/${PATH}"
export PATH
alias python=python3
alias pip=pip3

# Add brew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

#########
# THEME #
#########

# Source Prezto, an extension that makes it easy to set themes and configs
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Add conda environment info to right side of terminal line
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv anaconda root_indicator background_jobs history time)

# Remove username from left side of terminal line
DEFAULT_USER=`whoami`

##########
# BASICS #
##########

# Set nvim as default
export EDITOR='nvim'
export VISUAL='nvim'
alias vim='nvim'

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
    export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Make zsh not ask to autocorrect misspelled CLI commands
#unsetopt CORRECT

# Don't ask for confirmation on delete
unalias rm
setopt rm_star_silent

# Don't remove trailing slash on cd commands
setopt no_auto_remove_slash

# Add color to ls
alias ls='ls -G'

# Make ls always follow cd
function cd() {
    builtin cd "$@"
    ls
}

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

# Use z to search-cd
eval "$(zoxide init zsh)"
function z() {
    __zoxide_z "$@"
    ls
}
alias z=z

# Set up lazygit
alias lg=lazygit

#############
# FUNCTIONS #
#############

# Kill running jobs
function killjobs () {
    JOBS="$(jobs -p)";
    if [ -n "${JOBS}" ]; then
        kill -9 ${JOBS};
    fi
}

# fzf git diff
fd() {
    preview="git diff $@ --color=always -- {-1}"
    git diff $@ --name-only | fzf -m --ansi --preview $preview
}

#####################
# LANGUAGE SPECIFIC #
#####################

# Fix from matplotlib FAQ about virtual environments
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

# Activate Python virtual env
alias activate='source .venv/bin/activate'

## pyenv
#eval "$(pyenv init --path)"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1
#alias py3='pyenv activate py3'

# C++ flags
export CXXFLAGS="$CXXFLAGS -W -Wall -Werror -pedantic -std=c++14"

# Flutter + Dart
#export PATH="$PATH:/Applications/Flutter/bin"
#export PATH="$PATH":"$HOME/.pub-cache/bin"

# Node.js
export NVM_DIR="/usr/local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/etc/bash_completion.d/nvm" ] && \. "$NVM_DIR/etc/bash_completion.d/nvm" # This loads nvm bash_completion
