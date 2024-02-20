local M = {}

M.setup = function(use)
    use 'hiphish/rainbow-delimiters.nvim'  -- rainbow parentheses
    use 'lukas-reineke/indent-blankline.nvim'  -- visually display indent levels
    use 'hoob3rt/lualine.nvim'  -- better status line at bottom
    use 'junegunn/limelight.vim'  -- highlight current paragraph
    use 'preservim/vim-indent-guides'  -- visually display indent levels
    use 'godlygeek/tabular'  -- lines stuff up using whitespace

    require("rainbow-delimiters.setup").setup {}

    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'gruvbox',
            component_separators = {'', ''},
            section_separators = {'', ''},
            disabled_filetypes = {}
        },
        sections = {
            lualine_a = {'branch'},
            lualine_b = {'filename'},
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

    --vim-indent-guides
    vim.g.indent_guides_enable_on_vim_startup = 1
    vim.g.indent_guides_guide_size = 1
end

return M
