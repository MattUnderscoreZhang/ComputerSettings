local M = {}

M.setup = function(use)
    use 'hiphish/rainbow-delimiters.nvim'  -- rainbow parentheses
    use 'lukas-reineke/indent-blankline.nvim'  -- visually display indent levels
    use 'hoob3rt/lualine.nvim'  -- better status line at bottom
    use 'junegunn/limelight.vim'  -- highlight current paragraph
    use 'preservim/vim-indent-guides'  -- visually display indent levels
    use 'godlygeek/tabular'  -- lines stuff up using whitespace
    use 'folke/noice.nvim'  -- window in corner replaces other kinds of notifications

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

    --require("noice").setup({
        --lsp = {
            ---- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            --override = {
                --["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                --["vim.lsp.util.stylize_markdown"] = true,
                --["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            --},
        --},
        ---- you can enable a preset for easier configuration
        --presets = {
            --bottom_search = true, -- use a classic bottom cmdline for search
            --command_palette = true, -- position the cmdline and popupmenu together
            --long_message_to_split = true, -- long messages will be sent to a split
            --inc_rename = false, -- enables an input dialog for inc-rename.nvim
            --lsp_doc_border = false, -- add a border to hover docs and signature help
        --},
    --})

    --vim-indent-guides
    vim.g.indent_guides_enable_on_vim_startup = 1
    vim.g.indent_guides_guide_size = 1
end

return M
