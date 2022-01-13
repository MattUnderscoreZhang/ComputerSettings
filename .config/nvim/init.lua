require('plugins')

local o = vim.o  -- global options
local wo = vim.wo  -- window option
local bo = vim.bo  -- buffer settings
local g = vim.g  --
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

o.termguicolors = true
o.mouse = 'a'
o.clipboard = [[unnamed,unnamedplus]]
o.inccommand = 'nosplit'
o.expandtab = true
o.showmode = false
o.completeopt = [[menuone,noselect]]
o.updatetime = 300  -- update time for hovering
o.hidden = true
o.shiftwidth = 4
wo.signcolumn = 'yes'
wo.number = true
bo.swapfile = false
g.floaterm_width = 0.8
g.floaterm_height = 0.8
g.nvim_tree_side = 'right'
g.vimspector_enable_mappings = 'HUMAN'

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

-- context-sensitive tab
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end

-- context-sensitive shift+tab
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

-- for CharaChorder
vim.g.mapleader = ";"

local options = {noremap=true, silent=true}
map("i", "<tab>", "v:lua.tab_complete()", {expr=true})
map("s", "<tab>", "v:lua.tab_complete()", {expr=true})
map("i", "<s-tab>", "v:lua.s_tab_complete()", {expr=true})
map("s", "<s-tab>", "v:lua.s_tab_complete()", {expr=true})
map("n", "<space>", "za", options)
map("i", "<cr>", "compe#confirm('<cr>')", {silent=true, expr=true})
map("i", "jk", "<esc>", options)
map("t", "jk", "<c-\\><c-n>", options)
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
map("n", "<leader>.", "<cmd>lua require('telescope.builtin').file_browser()<cr>", options)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
map("n", "<leader>bl", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
map("n", "bd", "<cmd>Bwipeout!<cr>", options)
map("n", "<leader>x", "<cmd>lua require('telescope.builtin').commands()<cr>", options)
map("n", "<leader>dl", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", options)
map("n", "<leader>sf", "<cmd>luafile %<cr>", options)  -- source current file
map("n", "<leader>ia", "<cmd>edit ~/.config/nvim/init.lua <cr>", options)
map("n", "<leader>ib", "<cmd>edit ~/.config/nvim/lua/plugins.lua <cr>", options)
map("n", "<leader>si", "<cmd>luafile /Users/matt/.config/nvim/init.lua<cr>", options)  -- source lua init file
map("n", "<leader>e", ":NvimTreeFindFile<cr>", options)
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", options)
map("n", "<leader>pc", "<cmd>PackerClean<cr>", options)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options)  -- go to definition
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", options)  -- go to references
--map("n", "gb", "<c-o>", options)  -- go to references
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)  -- rename object
map("n", "<c-h>", "<c-w>h", options)
map("n", "<c-j>", "<c-w>j", options)
map("n", "<c-k>", "<c-w>k", options)
map("n", "<c-l>", "<c-w>l", options)
map("n", "<leader>tn", "<cmd>TestNearest<cr>", options)
map("n", "<leader>tf", "<cmd>TestFile<cr>", options)
map("n", "<leader>tl", "<cmd>TestLast<cr>", options)
map("n", "<leader>tv", "<cmd>TestVisit<cr>", options)
map("n", "<leader>ts", "<cmd>TestSuite<cr>", options)
--map("n", "<leader>ts", "<cmd>FloatermNew python /Users/matt/Projects/SimSpace/REDFOR/redfor/tests/run_all_tests.py<cr>", options)
map("n", "<leader>of", "<cmd>:term cd /Users/matt/Projects/SimSpace/REDFOR/; ./run_frontend.sh<cr>", options)
map("n", "<leader>ob", "<cmd>:term cd /Users/matt/Projects/SimSpace/REDFOR/; ./run_backend.sh<cr>", options)
map("n", "<leader>ol", "<cmd>:term cd /Users/matt/Projects/SimSpace/REDFOR/attack-designer/; open http://localhost:1234<cr>", options)
map("n", "<leader>ft", "<cmd>FloatermNew<cr>", options)
map("n", "<leader>lg", "<cmd>FloatermNew lazygit<cr>", options)
map("n", "s", "<Plug>(easymotion-s2)", {})
-- barbar
map("n", "<tab>", "<cmd>BufferNext<CR>", options)
map("n", "<s-tab>", "<cmd>BufferPrevious<CR>", options)
map("n", "gt", "<cmd>BufferMoveNext<CR>", options)
map("n", "gT", "<cmd>BufferMovePrevious<CR>", options)
map("n", "<leader>g", "<cmd>BufferPick<CR>", options)
-- other
map("n", "gn", "<c-^>", options)  -- jump to last used buffer
map("n", "<leader>o", "<cmd>SymbolsOutline<cr>", options)
map("n", "<leader>sd", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", options)
map("n", "<leader>sw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", options)
map("n", "<leader>m", "`", options)
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

-- set up LSP
local on_attach = function(client, _)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,  -- turn on LSP text popups
            signs = true,  -- warning and error symbols on left
            update_in_insert = false,  -- don't update while typing
        }
    )
    if client.resolved_capabilities.document_highlight then  -- glow when hovering
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#4B5263
        hi LspReferenceText cterm=bold ctermbg=red guibg=#4B5263
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#4B5263
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup {  -- Lua
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use' }
            }
        },
        workspace = {
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            }
        }
    }
}
lspconfig.pyright.setup { on_attach = on_attach }  -- Python
lspconfig.eslint.setup { on_attach = on_attach }  -- Typescript

cmd([[autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()]])  -- make error pop up on hovering a cursor over it

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

require('nvim-tree').setup {
    view = {
        side = 'right'
    }
}

require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { "javascript" },  -- List of parsers to ignore installing
    highlight = {
        enable = true,  -- false will disable the whole extension
        disable = { "c", "rust" },  -- list of language that will be disabled
    },
}

-- make vim-test print out to terminal
cmd([[let test#python#pytest#options = '-s']])
-- make vim-test use split window
cmd([[let test#strategy = "neovim"]])

require('neoscroll').setup{}

vim.opt.termguicolors = true

local function day_percentage()
    local time = os.date("*t")
    return os.date("%a %b %d %H:%M - ") .. string.format("%d", math.floor((time.hour + time.min/60)/24*100) + 1) .. "%%"
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
    lualine_a = {'mode', day_percentage},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
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

require('compe').setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = true;
        ultisnips = true;
    };
}

require('indent_guides').setup {
    even_colors = { fg = '#555555', bg = '#555555' };
    odd_colors = { fg = '#444444', bg = '#444444' };
}

vim.cmd([[colorscheme gruvbox]])

require('nvim-autopairs').setup{}

require('lspkind').init()
