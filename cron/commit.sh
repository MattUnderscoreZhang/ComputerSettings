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
cp -rf ~/.gitconfig git/
cp -rf ~/.ssh/config ssh/
cp -rf ~/Library/Application\ Support/lazygit/config.yml terminal/
cp -rf ~/.config/nvim/init.lua vim/
cp -rf ~/.config/nvim/lua/plugins.lua vim/
git add .
git commit -m "Daily commit"
git pull
if git status | grep -q ahead; then
    git push
fi
