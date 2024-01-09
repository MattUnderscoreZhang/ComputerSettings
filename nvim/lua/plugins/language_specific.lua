local M = {}

M.setup = function(use)
    -- markdown
    use {
        'iamcco/markdown-preview.nvim',  -- preview in browser
        run = function() vim.fn['mkdp#util#install']() end,
        ft = {'markdown'}
    }
    -- HTML
    use {
        'kylechui/nvim-surround',  -- edit surrounding tags
        'ap/vim-css-color',  -- show hex colors
    }
    -- Flutter
    use {
        'akinsho/flutter-tools.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }
    -- Arduino
    use 'stevearc/vim-arduino'
    -- Python
    use 'astral-sh/ruff-lsp'
end

require("nvim-surround").setup {}
require('flutter-tools').setup{}

require('lspconfig').ruff_lsp.setup {
    on_attach = function(client, bufnr)
        -- enable autocompletion
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- disable hover in favor of pyright
        client.server_capabilities.hoverProvider = false
    end,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    }
}

return M
