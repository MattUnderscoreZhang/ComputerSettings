local M = {}

M.setup = function(use)
    use 'hiphish/rainbow-delimiters.nvim'  -- rainbow parentheses
    use 'preservim/vim-indent-guides'  -- visually display indent levels
    use 'godlygeek/tabular'  -- lines stuff up using whitespace
    use 'folke/noice.nvim'  -- window in corner replaces other kinds of notifications

    require("rainbow-delimiters.setup").setup {}

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
