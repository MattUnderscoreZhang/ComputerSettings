return require('packer').startup(function(use)  -- passing use is a hack that prevents lua LSP errors
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
        'npxbr/gruvbox.nvim',  -- treesitter-consistent color schemes
        requires = 'rktjmp/lush.nvim'
    }
    use {
        'lewis6991/gitsigns.nvim',  -- gutter and endline messages
        requires = 'nvim-lua/plenary.nvim',
        -- tag = 'release' -- To use the latest release
    }
    -- LSP
    use {
        'neovim/nvim-lspconfig',  -- LSP configuration handling (including error messages and icons)
        'williamboman/nvim-lsp-installer'  -- install language servers for LSP
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
    use 'onsails/lspkind-nvim'  -- popups for info on autocompletion
    use 'L3MON4D3/luasnip'  -- snippets for autocompletion
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
    -- Flutter
    use {
        'akinsho/flutter-tools.nvim',  -- Flutter tools
        requires = 'nvim-lua/plenary.nvim',
    }
    -- other packages
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
end)
