########
# BREW #
########

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew install stuff
brew install fzf  # fuzzy find
brew install bat  # cat with syntax highlighting and git markup
brew install lazygit  # simple git GUI
brew install thefuck  # correct previous command
brew install zoxide  # quick cd to previously seen directory
brew install rg  # code-optimized quick grep
brew install dtrx  # do the right extraction
brew install postgresql  # postgres
brew install flyway  # database migration
brew install node  # JavaScript runtime environment
brew install awscli  # AWS CLI
brew install ruby  # Ruby interpreter and tools
brew install fish  # fish shell

###########
# CONFIGS #
###########

# all configs
cp -r .config ~/

# git
cp git/.gitconfig ~
git config --global user.name "Matt Zhang"
git config --global user.email "set.stun@gmail.com"

# lazygit
# cp lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml 

# pdb
cp python/.pdbrc.py ~

# ssh
cp ssh/config ~/.ssh/

# tmux
cp tmux/.tmux.conf ~

###########
# Z SHELL #
###########

# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto 
setopt EXTENDED_GLOB 
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do 
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" 
done 

# zsh
cp zsh/.zshrc ~ 
cp zsh/.zshenv ~ 
cp zsh/.zpreztorc ~ 
cp zsh/.zprofile ~ 
touch ~/.hushlogin  # don't display message on new shell

##########
# PYTHON #
##########

# pyenv
brew install pyenv
pyenv install 3.11  # install Python 3.11
brew install pyenv-virtualenv

## Pyright
#brew install pyright
## install pyenv-pyright to make Pyright work properly with virtual environments
#git clone https://github.com/alefpereira/pyenv-pyright.git $(pyenv root)/plugins/pyenv-pyright

##########
# NEOVIM #
##########

# nvim
brew install neovim
mkdir ~/.vim/tmp
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp -r nvim ~/.config/
cp nvim/.vimrc ~
#pip install pynvim
pip install ruff-lsp

##########
# MANUAL #
##########

# nvim
# in ~/.config/nvim/init.lua, comment out the first function, and replace ReloadModule with require for first time opening nvim
# <in vim> :PackerInstall
# <in vim> :LspInstall lua (sumneko_lua)
# <in vim> :LspInstall python (pyright)
# <in vim> :LspInstall typescript (eslint)

# set cron jobs
# crontab -e
# copy-paste cron/crontab in there
