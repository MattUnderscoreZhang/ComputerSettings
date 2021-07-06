return require('packer').startup(function()
    use 'wbthomason/packer.nvim'  -- package manager
    -- visuals
    use 'p00f/nvim-ts-rainbow'  -- rainbow parentheses
    use 'glepnir/indent-guides.nvim'  -- visually display indent levels (*)
    use 'akinsho/nvim-bufferline.lua'  -- add GUI visuals (*)
    use {
        'hoob3rt/lualine.nvim',  -- beter status line
        requires = {'kyazdani42/nvim-web-devicons', opt = true}  -- adds icons to plugins (*)
    }
    -- LSP
    use 'neovim/nvim-lspconfig'  -- automatic launching of LSP servers (*)
    use 'kabouzeid/nvim-lspinstall'  -- adds "LspInstall command for nvim-lspconfig
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/vim-vsnip' -- LSP-based snippet completion (*)
    -- code navigation
    use 'simrat39/symbols-outline.nvim'  -- code tree view sidebar (*)
    use 'kyazdani42/nvim-tree.lua'  -- file explorer (*)
    use 'nvim-treesitter/nvim-treesitter'  -- improves interface for nvim-tree and adds functionality (*)
    use 'majutsushi/tagbar' -- code tree viewer sidebar (*)
    use 'tmhedberg/SimpylFold'  -- code folding for Python
    use 'karb94/neoscroll.nvim'  -- smooth window scrolling
    use 'jremmen/vim-ripgrep'  -- allows using ripgrep inside vim
    use {
        'nvim-telescope/telescope.nvim',  -- file search and grep
         requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- other packages
    use 'godlygeek/tabular'  -- lines stuff up using whitespace (*)
    use 'scrooloose/nerdcommenter'  -- quickly comment and uncomment code
    use 'tpope/vim-commentary'  -- should decide whether to use this or nerdcommenter (*)
    use 'nvie/vim-flake8'  -- PEP8 linter using flake8
    use 'tpope/vim-abolish'  -- improved search & replace
    use 'JuliaEditorSupport/julia-vim'  -- LaTeX to Unicode for Julia
    use 'stevearc/vim-arduino'  -- Arduino functions
    use 'vim-test/vim-test' -- allows quick unit testing via key bindings
    use 'sharkdp/bat'
    use 'sharkdp/fd'
    use 'hrsh7th/nvim-compe'  -- autocompletion for nvim (*)
    use 'voldikss/vim-floaterm'  -- open floating terminal window in vim (*)
    use 'windwp/nvim-autopairs'  -- autocomplete brackets (*)
    use 'easymotion/vim-easymotion'  -- makes certain vim commands faster to execute (*)
end)
