-- Mason installs LSP and DAP servers, linters, and formatters (these are not nvim plugins).
-- Use :Mason to open GUI.
-- Mason only installs tools, but other plugins (e.g. nvim-lspconfig) let nvim use them.
-- An LSP server (i.e. pyright) allows for autocompletion, goto definition, hover docs, etc.
-- A DAP server (i.e. debugpy) debugging with breakpoints, stack traces, variable inspection, etc.
-- A linter (i.e. flake8) performs static code analysis and error/warning messages.
-- A formatter (i.e. black) performs code formatting.
-- Installing e.g. black with Mason allows formatting Python in nvim without being in the Python env.

return {
    'williamboman/mason.nvim',
    opts = {},
}
