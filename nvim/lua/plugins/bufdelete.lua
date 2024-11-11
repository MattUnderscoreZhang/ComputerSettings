local M = {}

-- Cleaner buffer closing. Used with barbar.

M.setup = function(use)
    use 'famiu/bufdelete.nvim'
    require("bufdelete")
end

return M
