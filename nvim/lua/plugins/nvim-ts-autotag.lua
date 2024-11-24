-- Auto-closes HTML tags.
-- cw-changing a tag will change the matching tag.

return {
    'windwp/nvim-ts-autotag',
    opts = function()
        require('nvim-ts-autotag').setup({
            opts = {
                enable_close = true,  -- auto-close tags
                enable_rename = true,  -- auto-rename tags
                enable_close_on_slash = true,  -- auto-close on trailing </
            },
        })
    end,
}
