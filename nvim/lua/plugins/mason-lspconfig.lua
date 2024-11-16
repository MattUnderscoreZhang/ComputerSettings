-- This bridges Mason and nvim-lspconfig.
-- Mason installs LSP servers (among other things), and nvim-lspconfig lets nvim use them.
-- This plugin makes it easier to auto-configure and setup servers installed with Mason.
-- Without this, you'd need to manually configure nvim-lspconfig with the server run command, etc.

return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        { 'kyazdani42/nvim-web-devicons', opts = {} },  -- icons in left gutter for warnings, errors, etc.
    },
    config = function()
        require('mason').setup()  -- do not call setup on nvim-lspconfig - let Mason handle setup
        require('mason-lspconfig').setup()
        require('mason-lspconfig').setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function (server_name) -- default handler (optional)
                require('lspconfig')[server_name].setup {}
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            ['rust_analyzer'] = function ()
                require('rust-tools').setup {}
            end
        }
    end
}
