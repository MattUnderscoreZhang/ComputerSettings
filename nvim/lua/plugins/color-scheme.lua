-- The color scheme to use.

return {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000,  -- load this before all other plugins
    config = function()
        require('everforest').setup()
        require('everforest').load()
    end,
}
