local M = {}

-- Provides more reliable and fine-grained syntax highlighting, improved parsing, advanced code navigation, and code folding.
-- Faster and better than just using LSP, but to be honest I don't really know where one starts and the other ends.
-- More info: https://www.reddit.com/r/neovim/comments/15jxqgn/i_dont_get_why_treesitter_is_a_big_deal_and_at/
-- Running :TSUpdate on first install is tricky. See https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation.
-- I can't really find a good way to solve this, so just restart nvim two times, until the problem's fixed.

M.setup = function(use)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    require('nvim-treesitter.configs').setup {
        ensure_installed = "all",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ignore_install = { "norg", "phpdoc", "swift" },  -- list of parsers to ignore installing
        highlight = {
            enable = true,  -- false will disable the whole extension
            --disable = { "c", "rust" },  -- list of language that will be disabled
        },
    }
end

return M
