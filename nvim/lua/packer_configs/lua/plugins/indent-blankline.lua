local M = {}

-- Visually displays indent levels with vertical lines.
-- Also displays current scope by underlining first and last lines.

M.setup = function(use)
    use 'lukas-reineke/indent-blankline.nvim'
    require("ibl").setup()
end

return M
