git config --global credential.helper store
huggingface-cli login

apt-get install neovim
mkdir ~/.vim/tmp
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp -r nvim ~/.config/nvim
cp nvim/.vimrc ~

# in ~/.config/nvim/init.lua, comment out the first function, and replace ReloadModule with require for first time opening nvim
# <in vim> :PackerInstall
# <in vim> :LspInstall lua (sumneko_lua)
# <in vim> :LspInstall python (pyright)
# <in vim> :LspInstall typescript (eslint)
