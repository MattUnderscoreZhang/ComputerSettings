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
end

require("nvim-surround").setup {}
require('flutter-tools').setup{}

return M
