local M = {}

-- This bridges Mason and nvim-lspconfig.
-- Mason installs LSP servers (among other things), and nvim-lspconfig lets nvim use them.
-- This plugin makes it easier to auto-configure and setup servers installed with Mason.
-- Without this, you'd need to manually configure nvim-lspconfig with the server run command, etc.

-- More on Mason:
-- Mason installs LSP and DAP servers, linters, and formatters (these are not nvim plugins).
-- Use :Mason to open GUI.
-- Mason only installs tools, but other plugins (e.g. nvim-lspconfig) let nvim use them.
-- An LSP server (i.e. pyright) allows for autocompletion, goto definition, hover docs, etc.
-- A DAP server (i.e. debugpy) debugging with breakpoints, stack traces, variable inspection, etc.
-- A linter (i.e. flake8) performs static code analysis and error/warning messages.
-- A formatter (i.e. black) performs code formatting.
-- Installing e.g. black with Mason allows formatting Python in nvim without being in the Python env.

M.setup = function(use)
    use {
        'williamboman/mason-lspconfig.nvim',
        requires = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
            'kyazdani42/nvim-web-devicons',  -- icons in left gutter for warnings, errors, etc.
        },
    }
    require('mason').setup()  -- do not call setup on nvim-lspconfig - let Mason handle setup
    require('mason-lspconfig').setup()
    require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function ()
            require("rust-tools").setup {}
        end
    }
end

return M
