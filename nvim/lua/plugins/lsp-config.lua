-- Configuration for LSP.
-- Do not do anything with this. Rely on mason-lspconfig.nvim to handle this.

return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.sourcekit.setup({
            -- capabilities = capabilities,
            capabilities = {
                workspace = {
                    didChangeWatchedFiles = {
                        dynamicRegistration = true,
                    },
                },
            },
        })
    end,
}
