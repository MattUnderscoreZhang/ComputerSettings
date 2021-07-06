require('plugins')

vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { "javascript" },  -- List of parsers to ignore installing
    highlight = {
        enable = true,  -- false will disable the whole extension
        disable = { "c", "rust" },  -- list of language that will be disabled
    },
}

require('lspconfig').pyright.setup{}

require('neoscroll').setup{}

vim.opt.termguicolors = true
require("bufferline").setup{}

require('lualine').setup{}
