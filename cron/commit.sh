#!/bin/bash

cd ~/Projects/Obsidian/
git add .
git commit -m "Daily commit"
git pull
if git status | grep -q ahead; then
    git push
fi

cd ~/Projects/VimNotes/
git add .
git commit -m "Daily commit"
git pull
if git status | grep -q ahead; then
    git push
fi

cd ~/Projects/ComputerSettings/
rsync -r ~/.config .
rsync -r ~/.gitconfig git/
rsync -r ~/.ssh/config ssh/
rsync -r ~/Library/Application\ Support/lazygit/config.yml terminal/
rsync -r ~/.config/kitty/ terminal/kitty/
rsync -r ~/.config/nvim/init.lua vim/
rsync -r ~/.config/nvim/lua/plugins.lua vim/
rsync -r ~/.tmux.conf tmux/
git add .
git commit -m "Daily commit"
git pull
if git status | grep -q ahead; then
    git push
fi
