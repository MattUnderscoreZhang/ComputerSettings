#!/bin/bash

cd ~/Projects/ComputerSettings/
rsync -r ~/.gitconfig git/
rsync -r ~/.ssh/config ssh/
rsync -r ~/Library/Application\ Support/lazygit/config.yml terminal/
rsync -r ~/.config/kitty/ terminal/kitty/
rsync -r ~/.zshrc terminal/zsh/
rsync -r ~/.config/nvim/init.lua nvim/
rsync -r ~/.config/nvim/lua nvim/
rsync -r ~/.vimrc nvim/
git add .
git commit -m "Daily commit"
git pull
if git status | grep -q ahead; then
    git push
fi
