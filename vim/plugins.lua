return require('packer').startup(function(use)  -- passing use is a hack that prevents lua LSP errors
    -- package management
    use 'wbthomason/packer.nvim'  -- package manager
    -- visuals
    use 'p00f/nvim-ts-rainbow'  -- rainbow parentheses
    use 'glepnir/indent-guides.nvim'  -- visually display indent levels
    use {
        'romgrk/barbar.nvim',  -- buffer control
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use 'hoob3rt/lualine.nvim'  -- beter status line at bottom
    use {
        'npxbr/gruvbox.nvim',  -- treesitter-consistent color schemes
        requires = {"rktjmp/lush.nvim"}  -- (*)
    }
    -- LSP
    use {
        'neovim/nvim-lspconfig',  -- automatic launching of LSP servers
        'williamboman/nvim-lsp-installer'  -- install language servers for LSP
    }
    use { 'tami5/lspsaga.nvim' }  -- error diagnostics on hover (maintained branch)
    use {
        'ray-x/navigator.lua',  -- error diagnostics on hover
        requires = {'ray-x/guihua.lua', run='cd lua/fzy && make'}
    }
    -- autocompletion
    use 'hrsh7th/nvim-cmp'  -- autocompletion for nvim
    use 'hrsh7th/cmp-nvim-lsp'  -- autocompletion for nvim
    use 'hrsh7th/cmp-buffer'  -- autocompletion for nvim
    use 'hrsh7th/cmp-path'  -- autocompletion for nvim
    use 'hrsh7th/cmp-cmdline'  -- autocompletion for nvim
    use 'onsails/lspkind-nvim'  -- popups for info on autocompletion
    use 'L3MON4D3/luasnip'  -- snippets for autocompletion
    -- LLDB debugging
    use 'sakhnik/nvim-gdb' -- GDB, LLDB, pdb++ integration
    -- code navigation
    use 'simrat39/symbols-outline.nvim'  -- code tree view sidebar (*)
    use {
        'kyazdani42/nvim-tree.lua',  -- file explorer (*)
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup () end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'majutsushi/tagbar' -- code tree viewer sidebar (*)
    use 'karb94/neoscroll.nvim'  -- smooth window scrolling
    use 'jremmen/vim-ripgrep'  -- allows using ripgrep inside vim
    use {
        'nvim-telescope/telescope.nvim',  -- file search and grep
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'famiu/bufdelete.nvim' -- cleaner buffer closing
    -- Flutter
    use 'dart-lang/dart-vim-plugin'  -- syntax highlighting and code formatting
    use 'thosakwe/vim-flutter'  -- run Flutter commands
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
    use 'easymotion/vim-easymotion'  -- makes certain vim commands faster to execute (*)
    use 'puremourning/vimspector'  -- graphical debugger
    use 'szw/vim-maximizer'  -- maximize split panes
    use 'sotte/presenting.vim'  -- slides in vim
end)
