local M = {}

-- Icons for autocompletion popup.
-- Used with nvim-cmp.

M.setup = function(use)
    use 'onsails/lspkind-nvim'
    require('lspkind').init({
        mode = "symbol_text",  -- display icon, then text
        preset = 'default',  -- use default nerd font icons
    })
end

return M
