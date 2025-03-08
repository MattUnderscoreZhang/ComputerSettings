-- AI code completion

return {
    'github/copilot.vim',
    branch = "release",
    --opts = function()
        --local sysname = vim.loop.os_uname().sysname
        --if sysname == "Darwin" then
            --vim.g.copilot_node_command = "/opt/homebrew/bin/node"
        --end
    --end
    config = function()
        -- Disable Copilot for .txt files
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "txt", "markdown" },
            callback = function()
                vim.cmd("Copilot disable")
            end,
        })

        -- Optional: Additional Copilot configuration
        -- For example, setting the node command for macOS
        local sysname = vim.loop.os_uname().sysname
        if sysname == "Darwin" then
            vim.g.copilot_node_command = "/opt/homebrew/bin/node"
        end
    end,
}
