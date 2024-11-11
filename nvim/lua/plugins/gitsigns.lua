local M = {}

-- Visually displays git info and provides some shortcut functionality.
-- Displays changes in gutter on the left (new line, changed line, deleted line).
-- Displays text of git blame on the right.
-- :Gitsigns functions allow quick navigation between hunks (blocks of git changes), and allows undoing or staging hunks.

M.setup = function(use)
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        -- tag = 'release' -- To use the latest release
    }
    require('gitsigns').setup{
        current_line_blame = true,
        current_line_blame_opts = {
            virtual_text = false,
            delay = 0,
        },
    }
end

return M
