local M = {}

M.setup = function(use)
    use {
        'lewis6991/gitsigns.nvim',  -- git changes on left, git blame on right
        requires = 'nvim-lua/plenary.nvim',
        -- tag = 'release' -- To use the latest release
    }
    use 'kdheepak/lazygit.nvim'  -- lazygit integration
end

require('gitsigns').setup{
    current_line_blame = true,
    current_line_blame_opts = {
        virtual_text = false,
        delay = 0,
    },
}

return M
