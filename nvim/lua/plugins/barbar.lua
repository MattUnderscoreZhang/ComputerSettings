-- Buffer control. Controls the navigation bar at the top and easy movement between buffer tabs.
-- Used with bufdelete for closing buffers.

return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',  -- git status icons in tabs
        'kyazdani42/nvim-web-devicons',  -- file icons in tabs
    },
}
