local M = {}

M.setup = function(use)
    use 'Chiel92/vim-autoformat'  -- autoformatter
    use 'nvie/vim-flake8'  -- PEP8 linter using flake8
    use 'tpope/vim-abolish'  -- improved search & replace
    use 'JuliaEditorSupport/julia-vim'  -- LaTeX to Unicode for Julia
    use 'vim-test/vim-test' -- allows quick unit testing via key bindings
    use 'voldikss/vim-floaterm'  -- open floating terminal window in vim
    use 'windwp/nvim-autopairs'  -- autocomplete brackets
    use 'szw/vim-maximizer'  -- maximize split panes
    use 'tpope/vim-unimpaired'  -- advanced mappings

    vim.g.NERDCustomDelimiters = {
        ['text'] = { left = '- ', right = '' }
    }

    vim.cmd([[
        let test#neovim#term_position = "vert botright"
    ]])

    vim.cmd([[let test#python#pytest#options = '-s']])  -- make vim-test print out to terminal

    vim.cmd([[let test#strategy = "neovim"]])  -- make vim-test use split window

    local autopairs = require('nvim-autopairs')
    local pair_rules = require('nvim-autopairs.rule')
    local pair_conds = require('nvim-autopairs.conds')
    autopairs.setup()
    autopairs.remove_rule("'''")
    autopairs.get_rules("'")[1]
        :with_pair(
            function(opts)
                local prev_char = opts.line:sub(opts.col - 2, opts.col - 1)
                return not (prev_char == "''")
            end
        )  -- prevent closing of triple single quotes
    autopairs.remove_rule('"""')
    autopairs.get_rules('"')[1]
        :with_pair(
            function(opts)
                local prev_char = opts.line:sub(opts.col - 2, opts.col - 1)
                return not (prev_char == '""')
            end
        )  -- prevent closing of triple double quotes
    autopairs.remove_rule("```")
    autopairs.get_rules("`")[1]
        :with_pair(
            function(opts)
                local prev_char = opts.line:sub(opts.col - 2, opts.col - 1)
                return not (prev_char == "``")
            end
        )  -- prevent closing of triple backticks
end

return M
