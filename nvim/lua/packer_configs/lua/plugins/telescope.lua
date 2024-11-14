local M = {}

-- File search and grep.
-- Opens the panel for fuzzy searching file names and contents.

M.setup = function(use)
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
    }
end

return M
