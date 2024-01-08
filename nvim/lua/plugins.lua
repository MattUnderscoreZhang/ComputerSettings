local packer = require('packer')

-- have Packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- load all plugins
packer.startup(
    function(use)
        local plugin_dir = vim.fn.stdpath('config') .. '/lua/plugins'
        local plugins = vim.fn.readdir(plugin_dir)
        for _, plugin in ipairs(plugins) do
            require('plugins.' .. plugin:gsub("%.lua$", "")).setup(use)
        end
    end
)
