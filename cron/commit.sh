cd ~/Projects/Cambion/
git add *
git commit -m "Daily commit"
git pull
git push

cd ~/Projects/VimNotes/
git add *
git commit -m "Daily commit"
git pull
git push

cd ~/Projects/ComputerSettings/
rm -rf .config/
cp -rf ~/.config .
cp ~/.gitconfig git/
cp ~/.ssh/config ssh/
cp ~/Library/Application\ Support/lazygit/config.yml terminal/
cp ~/.config/nvim/init.lua vim/
cp ~/.config/nvim/lua/plugins.lua vim/
git add .
git commit -m "Daily commit"
git pull
git push
