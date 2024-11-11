local M = {}

-- Displays filesystem in a sidebar.
-- Allows file management in the sidebar.
-- Shift+H to show/hide hidden files.

M.setup = function(use)
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',  -- icons in sidebar
    }
    -- In a previous version I had to set these options manually in ~/.local/share/nvim/site/pack/packer/start/nvim-tree.lua/lua/nvim-tree.lua
    require('nvim-tree').setup {
        reload_on_bufenter = true,
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
        view = {
            side = "right",
        },
        renderer = {
            group_empty = true,
            highlight_git = true,
            highlight_opened_files = "all",
        },
        filters = {
            custom = {"__pycache__", "__pypackages__", ".DS_Store" },
        },
    }
end

return M
