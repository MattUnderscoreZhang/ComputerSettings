#!/bin/bash

cd ~/Projects/ComputerSettings/
rm -rf git/ && rsync -r ~/.gitconfig git/
rm -rf ssh/ && rsync -r ~/.ssh/config ssh/
rm -rf terminal/ && rsync -r ~/Library/Application\ Support/lazygit/config.yml terminal/
rsync -r ~/.config/kitty/ terminal/kitty/
rsync -r ~/.zshrc terminal/zsh/
rm -rf nvim/ && rsync -r ~/.config/nvim/ nvim/
rsync -r ~/.vimrc nvim/
git add .
git commit -m "Daily commit"
git pull
if git status | grep -q ahead; then
    git push
fi
