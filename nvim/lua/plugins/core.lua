local M = {}

M.setup = function(use)
    use {
        'wbthomason/packer.nvim',  -- package manager (for nvim plugins)
        'williamboman/mason.nvim',  -- install LSP and DAP servers, linters, and formatters (these are not nvim plugins)
    }
    use {
        'neovim/nvim-lspconfig',  -- gives LSP support (autocompletion, error messages, goto definition, reference finding, etc.)
        'williamboman/mason-lspconfig.nvim'  -- bridges mason and nvim-lspconfig
    }
    use {
        'nvim-treesitter/nvim-treesitter',  -- parses code as abstract syntax tree (highlighting, code folding, indentation, etc.)
        run = ":TSUpdate",
    }
    use {
        'nvim-telescope/telescope.nvim',  -- file search and grep
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'kyazdani42/nvim-tree.lua',  -- file explorer (*)
        requires = 'kyazdani42/nvim-web-devicons',
    }
end

require('mason').setup()  -- use :Mason to open GUI
require('mason-lspconfig').setup()  -- do not set up nvim-lspconfig - let mason handle setup
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

require('nvim-treesitter.configs').setup {
    ensure_installed = "all",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { "norg", "phpdoc", "swift" },  -- list of parsers to ignore installing
    highlight = {
        enable = true,  -- false will disable the whole extension
        --disable = { "c", "rust" },  -- list of language that will be disabled
    },
}

-- In a previous version I had to set these options manually in ~/.local/share/nvim/site/pack/packer/start/nvim-tree.lua/lua/nvim-tree.lua
require('nvim-tree').setup {
    reload_on_bufenter = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = {
        side = "right",
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "all",
    },
    filters = {
        custom = {"__pycache__", "__pypackages__", ".DS_Store" },
    },
}

return M
