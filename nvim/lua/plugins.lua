-- have Packer use a popup window
require('packer').init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end,
    },
}

require('packer').startup(
function(use)  -- passing use is a hack that prevents lua LSP errors
    -- package management
    use 'wbthomason/packer.nvim'  -- package manager
    -- visuals
    use 'p00f/nvim-ts-rainbow'  -- rainbow parentheses
    use 'lukas-reineke/indent-blankline.nvim'  -- visually display indent levels
    use {
        'romgrk/barbar.nvim',  -- buffer control
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'hoob3rt/lualine.nvim'  -- better status line at bottom
    use {
        'lewis6991/gitsigns.nvim',  -- gutter and endline messages
        requires = 'nvim-lua/plenary.nvim',
        -- tag = 'release' -- To use the latest release
    }
    -- themes
    use {
        'npxbr/gruvbox.nvim',
        requires = 'rktjmp/lush.nvim'
    }
    use 'sainnhe/everforest'
    -- LSP
    use {
        'neovim/nvim-lspconfig',  -- LSP configuration handling (including error messages and icons)
        'williamboman/mason.nvim',  -- install LSP and DAP servers, linters, and formatters
        'williamboman/mason-lspconfig.nvim'  -- bridges mason and nvim-lspconfig
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
    }
    use {
        'iamcco/markdown-preview.nvim',  -- Markdown preview in browser
        run = function() vim.fn['mkdp#util#install']() end,
        ft = {'markdown'}
    }
    use 'Chiel92/vim-autoformat'  -- autoformatter
    -- debugging
    use 'puremourning/vimspector'  -- graphical debugger
    use 'sakhnik/nvim-gdb' -- GDB, LLDB, pdb++ integration
    use 'tami5/lspsaga.nvim'  -- error diagnostics on hover (maintained branch of original lspsaga)
    -- autocompletion
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
    -- code navigation
    use 'simrat39/symbols-outline.nvim'  -- code tree view sidebar (*)
    use {
        'kyazdani42/nvim-tree.lua',  -- file explorer (*)
        requires = 'kyazdani42/nvim-web-devicons',
    }
    use 'majutsushi/tagbar' -- code tree viewer sidebar (*)
    use 'karb94/neoscroll.nvim'  -- smooth window scrolling
    use 'jremmen/vim-ripgrep'  -- allows using ripgrep inside vim
    use {
        'nvim-telescope/telescope.nvim',  -- file search and grep
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'famiu/bufdelete.nvim' -- cleaner buffer closing
    use 'nacro90/numb.nvim' -- line number peaking
    use 'ahmedkhalf/project.nvim'  -- project management and navigation
    -- Flutter
    use {
        'akinsho/flutter-tools.nvim',  -- Flutter tools
        requires = 'nvim-lua/plenary.nvim',
    }
    -- other packages
    use 'famiu/nvim-reload'  -- reload nvim configs
    use 'godlygeek/tabular'  -- lines stuff up using whitespace
    use 'scrooloose/nerdcommenter'  -- quickly comment and uncomment code
    use 'nvie/vim-flake8'  -- PEP8 linter using flake8
    use 'tpope/vim-abolish'  -- improved search & replace
    use 'JuliaEditorSupport/julia-vim'  -- LaTeX to Unicode for Julia
    use 'stevearc/vim-arduino'  -- Arduino functions
    use 'vim-test/vim-test' -- allows quick unit testing via key bindings
    use 'voldikss/vim-floaterm'  -- open floating terminal window in vim
    use 'windwp/nvim-autopairs'  -- autocomplete brackets
    use 'easymotion/vim-easymotion'  -- quick search in file
    use 'szw/vim-maximizer'  -- maximize split panes
    use 'kdheepak/lazygit.nvim'  -- lazygit integration
    use 'konfekt/fastfold'  -- prevent over-eager code folding
    use 'tpope/vim-unimpaired'  -- advanced mappings
end
)

-- bufdelete
require("bufdelete")

-- project.nvim
require("project_nvim").setup {}
require("telescope").load_extension('projects')

-- do not set up nvim-lspconfig - let mason handle setup
require('mason').setup()  -- use :Mason to open GUI
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

-- look in ~/.config/pycodestyle to set Python style-based warnings

-- nvim-tree.lua
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

-- lualine
local function day_click_count()
    local time = os.date("*t")
    return os.date("%a %b %d %H:%M - ") .. string.format("%d", math.floor((time.hour + time.min/60)*12+1)) .. ' clicks'
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {day_click_count},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        --lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_x = {'mode'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

-- luasnip + nvim-cmp + lspkind-nvim (https://www.youtube.com/watch?v=GuIcGxYqaQQ)
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {
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

-- indent-blankline
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    --show_current_context_start = true,
}

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = "all",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { "norg", "phpdoc", "swift" },  -- list of parsers to ignore installing
    highlight = {
        enable = true,  -- false will disable the whole extension
        --disable = { "c", "rust" },  -- list of language that will be disabled
    },
}

-- neoscroll
require('neoscroll').setup{}

-- nvim-autopairs
require('nvim-autopairs').setup{}

-- flutter-tools
require('flutter-tools').setup{}

-- gitsigns
require('gitsigns').setup{
    current_line_blame = true,
    current_line_blame_opts = {
        virtual_text = false,
        delay = 0,
    },
}

-- numb
require('numb').setup()

-- vim-test
vim.cmd([[
    let test#neovim#term_position = "vert botright"
]])
