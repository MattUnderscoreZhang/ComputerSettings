local M = {}

M.setup = function(use)
    use {
        'github/copilot.vim',  -- AI code completion
        branch = "release",
        config = function()
            local sysname = vim.loop.os_uname().sysname
            if sysname == "Darwin" then
                --vim.g.copilot_node_command = "/usr/local/Cellar/node/19.2.0/bin/node"
                vim.g.copilot_node_command = "/opt/homebrew/bin/node"
            end
        end
    }
end

return M
