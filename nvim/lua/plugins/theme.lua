local M = {}

M.setup = function(use)
    use {
        'npxbr/gruvbox.nvim',
        requires = 'rktjmp/lush.nvim'
    }
    use 'sainnhe/everforest'
end

vim.cmd([[colorscheme everforest]])

return M
