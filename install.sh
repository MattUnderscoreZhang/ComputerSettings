# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew install stuff
brew install fzf
brew install bat
brew install lazygit
brew install thefuck
brew install zoxide
brew install rg
brew install dtrx
brew install postgresql
brew install flyway

# all configs
cp -r .config ~/

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

# git
cp git/.gitconfig ~

# lazygit
# cp lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml 

## pyenv
#brew install pyenv
#brew install pyenv-virtualenv
#pyenv install 3.9.10
#pyenv virtualenv 3.9.10 py39

## Pyright
#brew install pyright
## install pyenv-pyright to make Pyright work properly with virtual environments
#git clone https://github.com/alefpereira/pyenv-pyright.git $(pyenv root)/plugins/pyenv-pyright

# poetry
# https://python-poetry.org/docs/
curl -sSL https://install.python-poetry.org | python3 -

# pdb
cp python/.pdbrc.py ~

# ssh
cp ssh/config ~/.ssh/

# tmux
cp tmux/.tmux.conf ~

# nvim
brew install neovim
mkdir ~/.vim/tmp
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp -r nvim ~/.config/

# nvim
# in ~/.config/nvim/init.lua, comment out the first function, and replace ReloadModule with require for first time opening nvim
# <in vim> :PackerInstall
# <in vim> :LspInstall lua (sumneko_lua)
# <in vim> :LspInstall python (pyright)
# <in vim> :LspInstall typescript (eslint)

# ignore zathura

# install CaskaydiaCover Nerd Font

# set cron jobs
# crontab -e
# copy-paste cron/crontab in there
