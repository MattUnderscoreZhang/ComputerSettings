require('plugins')

local o = vim.o  -- global options
local wo = vim.wo  -- window option
local bo = vim.bo  -- buffer settings
local g = vim.g  --
local cmd = vim.cmd
local opt = vim.opt
local map = vim.api.nvim_set_keymap

o.termguicolors = true
o.mouse = 'a'
o.clipboard = [[unnamed,unnamedplus]]
o.inccommand = 'nosplit'
o.expandtab = true
o.showmode = false
o.completeopt = [[menu,menuone,noselect]]
o.updatetime = 300  -- update time for hovering
o.hidden = true
o.shiftwidth = 4
wo.signcolumn = 'yes'
wo.number = true
bo.swapfile = false
g.floaterm_width = 0.8
g.floaterm_height = 0.8
g.vimspector_enable_mappings = 'HUMAN'
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.termguicolors = true
cmd([[colorscheme gruvbox]])

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- for CharaChorder
g.mapleader = ";"

-- no inline error messages
vim.diagnostic.config({virtual_text = false, underline = false})

-- error and warning icons in gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- disable folding on startup (zi to enable)
cmd([[autocmd! FileType text setlocal foldmethod=indent]])
vim.api.nvim_exec([[set foldenable!]], false)

local options = {noremap=true, silent=true}
-- built-in
map("n", "<space>", "za", options)
--map("i", "<cr>", "cmp#confirm('<cr>')", {silent=true, expr=true})
map("i", "jk", "<esc>", options)
map("t", "jk", "<c-\\><c-n>", options)
map("n", "bd", "<cmd>Bwipeout!<cr>", options)
map("n", "<c-h>", "<c-w>h", options)
map("n", "<c-j>", "<c-w>j", options)
map("n", "<c-k>", "<c-w>k", options)
map("n", "<c-l>", "<c-w>l", options)
map("n", "gn", "<c-^>", options)  -- jump to last used buffer
map("n", "<leader>o", "<cmd>SymbolsOutline<cr>", options)
map("n", "<leader>m", "`", options)
-- black
map("n", "<leader>bl", "<cmd>!black " .. vim.api.nvim_buf_get_name('%') .. "<cr>", options)  -- run Black on current file
-- splits
map("n", "<c-v>", "<c-w>v", options)  -- split vertically
map("n", "<c-s>", "<c-w>s", options)  -- split horizontally
map("n", "<c-c>", "<c-w>c", options)  -- close split
-- lua config shortcuts
map("n", "<leader>ia", "<cmd>edit ~/.config/nvim/init.lua <cr>", options)
map("n", "<leader>ib", "<cmd>edit ~/.config/nvim/lua/plugins.lua <cr>", options)
map("n", "<leader>si", "<cmd>luafile /Users/matt/.config/nvim/init.lua<cr>", options)  -- source lua init file
map("n", "<leader>sf", "<cmd>luafile %<cr>", options)  -- source current file
-- telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
map("n", "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>", options)
map("n", "<leader>dl", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", options)
map("n", "<leader>sd", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", options)
map("n", "<leader>sw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", options)
-- nvim-tree
map("n", "<leader>e", ":NvimTreeFindFile<cr>", options)
-- packer
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", options)
map("n", "<leader>pc", "<cmd>PackerClean<cr>", options)
-- lsp
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options)  -- go to definition
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", options)  -- go to references
--map("n", "gb", "<c-o>", options)  -- go to references
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)  -- rename object
-- vim-test
map("n", "<leader>tn", "<cmd>TestNearest<cr>", options)
map("n", "<leader>tf", "<cmd>TestFile<cr>", options)
map("n", "<leader>tl", "<cmd>TestLast<cr>", options)
map("n", "<leader>tv", "<cmd>TestVisit<cr>", options)
map("n", "<leader>ts", "<cmd>TestSuite<cr>", options)
-- REDFOR-specific shortcuts
--map("n", "<leader>ts", "<cmd>FloatermNew python /Users/matt/Projects/SimSpace/REDFOR/redfor/tests/run_all_tests.py<cr>", options)
map("n", "<leader>tp", "<cmd>FloatermNew python " .. vim.api.nvim_buf_get_name('%') .. "<cr>", options)  -- execute main function of current file
map("n", "<leader>of", "<cmd>:term cd /Users/matt/Projects/SimSpace/REDFOR/; ./run_frontend.sh<cr>", options)
map("n", "<leader>ob", "<cmd>:term cd /Users/matt/Projects/SimSpace/REDFOR/; ./run_backend.sh<cr>", options)
map("n", "<leader>ol", "<cmd>:term cd /Users/matt/Projects/SimSpace/REDFOR/attack-designer/; open http://localhost:1234<cr>", options)
-- lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", options)
-- vim-easymotion
map("n", "f", "<Plug>(easymotion-s2)", {})
-- barbar
map("n", "<tab>", "<cmd>BufferNext<CR>", options)
map("n", "<s-tab>", "<cmd>BufferPrevious<CR>", options)
map("n", "gt", "<cmd>BufferMoveNext<CR>", options)
map("n", "gT", "<cmd>BufferMovePrevious<CR>", options)
map("n", "<leader>g", "<cmd>BufferPick<CR>", options)
-- vimspector
map("n", "<leader>db", ":call vimspector#ToggleBreakpoint()<CR>", options)
map("n", "<leader>dx", ":call vimspector#ClearBreakpoints()<CR>", options)
map("n", "<leader>dc", ":call vimspector#Continue()<CR>", options)
map("n", "<leader>dd", ":call vimspector#Launch()<CR>", options)
map("n", "<leader>dr", ":call vimspector#Restart()<CR>", options)
map("n", "<leader>ds", ":call vimspector#StepOver()<CR>", options)
map("n", "<leader>di", ":call vimspector#StepInto()<CR>", options)
map("n", "<leader>do", ":call vimspector#StepOut()<CR>", options)
map("n", "<leader>dw", ":VimspectorWatch ", options)
-- flutter-tools
map("n", "<leader>fxd", ":FlutterRun --debug<cr>", options)
map("n", "<leader>fxr", ":FlutterRun --release<cr>", options)
map("n", "<leader>fd", ":FlutterDevices<cr>", options)
map("n", "<leader>fe", ":FlutterEmulators<cr>", options)
map("n", "<leader>fr", ":FlutterReload<cr>", options)
map("n", "<leader>fR", ":FlutterRestart<cr>", options)
map("n", "<leader>fq", ":FlutterQuit<cr>", options)
map("n", "<leader>fo", ":FlutterOutlineToggle<cr>", options)
-- flutter testing
map("n", "<leader>ftt", "<cmd>FloatermNew flutter test " .. vim.api.nvim_buf_get_name('%') .. "<cr>", options)
map("n", "<leader>fta", "<cmd>FloatermNew flutter test <cr>", options)
-- gitsigns
map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", options)

-- don't redefine these functions on config reload
-- calculator via bash bc
cmd([[
function! MyCalc(str)
    return system("echo 'x=" . a:str . ";d=.5/10^" . g:MyCalcPrecision
    \. ";if (x<0) d=-d; x+=d; scale=" . g:MyCalcPrecision . ";print x/1' | bc -l")
endfunction

function! DayCalcPercent(str)
    return system("echo -n \\\(; echo 'x=(" . a:str . ")*100;d=.5/10^" . g:MyCalcPrecision
    \. ";if (x<0) d=-d; x+=d; scale=" . g:MyCalcPrecision . ";print x/1' | bc -l; echo -n \\\%\\\)")
endfunction

function! MyCalcNoRound(str)
    return system("echo 'scale=" . g:MyCalcPrecision . " ; print " . a:str . "' | bc -l")
endfunction

let g:MyCalcPrecision = 2  " Control the precision with this variable

map <silent> <leader>cr :s/\$\(.*\)\$/\=MyCalc(submatch(1))/g<CR>:noh<CR>
map <silent> <leader>cp :s/\$\(.*\)\$/\=DayCalcPercent(submatch(1))/g<CR>:noh<CR>
]])

-- line and cursor wrapping
cmd([[
" Go up and down screen lines when wrap is on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Toggle cursor line wrap (jump b/w front and end of lines)
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        nnoremap j gj
        nnoremap k gk
        vnoremap j gj
        vnoremap k gk
        nnoremap <Down> gj
        nnoremap <Up> gk
        vnoremap <Down> gj
        vnoremap <Up> gk
        inoremap <Down> <C-o>gj
        inoremap <Up> <C-o>gk
        endif
endfunction

" Cursor Wrap
set whichwrap+=<,>,h,l,[,]
]])

-- do not set up lsp-config - let nvim-lsp-installer handle setup
require('nvim-lsp-installer').on_server_ready(
    function(server)
        local opts = {}
        if server.name == 'sumneko_lua' then
            opts.settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'}  -- remove nvim config errors
                    }
                }
            }
        end
        server:setup(opts)
    end
)

-- look in ~/.config/pycodestyle to set Python style-based warnings

-- lspsaga
cmd([[autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()]])  -- make error pop up on hovering a cursor over it

-- vim-test
cmd([[let test#python#pytest#options = '-s']])  -- make vim-test print out to terminal
cmd([[let test#strategy = "neovim"]])  -- make vim-test use split window

-- nvim-tree.lua
require('nvim-tree').setup{
    view = {
        side = "right",
    },
}
-- I had to set view.side = 'right' manually in packer/start/nvim-tree.lua/lua/nvim-tree.lua

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

-- luasnip + nvim-cmp
local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<s-tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

-- indent-blankline
opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    --show_current_context_start = true,
}

-- lspkind-nvim
require('lspkind').init()

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

-- nvim-gdb
g.loaded_nvimgdb = 1  -- disable

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
