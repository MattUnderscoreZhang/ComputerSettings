local M = {}

M.setup = function(use)
    use 'hrsh7th/nvim-cmp'  -- autocompletion for nvim
    use 'hrsh7th/cmp-nvim-lsp'  -- autocompletion for nvim
    use 'hrsh7th/cmp-buffer'  -- autocompletion for nvim
    use 'hrsh7th/cmp-path'  -- autocompletion for nvim
    use 'hrsh7th/cmp-cmdline'  -- autocompletion for nvim
    use 'hrsh7th/cmp-copilot'  -- autocompletion for copilot
    use {
        'github/copilot.vim',  -- AI code completion
        branch = "release",
        config = function()
            local sysname = vim.loop.os_uname().sysname
            if sysname == "Darwin" then
                vim.g.copilot_node_command = "/usr/local/Cellar/node/19.2.0/bin/node"
            end
        end
    }
    use 'onsails/lspkind-nvim'  -- icons for autocompletion popup window
    use 'saadparwaiz1/cmp_luasnip'  -- snippet completions
end

local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup {  -- luasnip + nvim-cmp + lspkind-nvim (https://www.youtube.com/watch?v=GuIcGxYqaQQ)
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            {
                "i",
                "s",
            }
        ),
        ["<S-Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
            {
                "i",
                "s",
            }
        ),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
            mode = 'symbol',  -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                vim_item.menu = ({
                    copilot = "[Copilot]",
                    nvim_lsp = "[LSP]",
                    --buffer = "[Buffer]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end
        })
    },
    sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        --{ name = "buffer" },
        { name = "path" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
}

return M
