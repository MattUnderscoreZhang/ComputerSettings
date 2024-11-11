-- Load all plugins in the ~/.config/nvim/lua/plugins/ directory.
-- Each plugin should have a setup function that takes a use argument.
-- The use argument is a function provided by Packer.
-- Packer will use this function to install and load the plugin.

require("packer").startup(
    function(use)
        local plugin_dir = vim.fn.stdpath('config') .. '/lua/plugins'
        local plugins = vim.fn.readdir(plugin_dir)
        for _, plugin in ipairs(plugins) do
            if vim.fn.isdirectory(plugin_dir .. '/' .. plugin) == 0 then  -- skip directories
                require('plugins.' .. plugin:gsub("%.lua$", "")).setup(use)
            end
        end
    end
)
