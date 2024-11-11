local M = {}

-- Lazygit integration. Opens a floating panel to easily commit, push, etc.
-- Requires Lazygit to be installed on the system.

M.setup = function(use)
    use 'kdheepak/lazygit.nvim'
end

return M
