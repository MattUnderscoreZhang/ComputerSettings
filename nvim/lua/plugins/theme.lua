local M = {}

M.setup = function(use)
    --use {
        --'npxbr/gruvbox.nvim',
        --requires = 'rktjmp/lush.nvim'
    --}
    use 'sainnhe/everforest'

    vim.cmd([[colorscheme everforest]])
end

return M
