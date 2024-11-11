local M = {}

-- Smooth window scrolling.

M.setup = function(use)
    use 'karb94/neoscroll.nvim'
    require('neoscroll').setup{}
end

return M
