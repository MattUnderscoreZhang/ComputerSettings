local M = {}

-- Only show the line number in the sidebar when jumping to line.

M.setup = function(use)
    use 'nacro90/numb.nvim'
    require('numb').setup()
end

return M
