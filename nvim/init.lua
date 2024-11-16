-- if lazy.nvim is not present, clone it
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"  -- stdpath("data") is ~/.local/share/nvim for Mac/Linux
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)  -- adds repo to runtimepath

-- set leader keys before loading lazy.nvim
vim.g.mapleader = ";"
require("lazy").setup("plugins")

-- set nvim configs
require('options')
require('mappings')
require('functions')
