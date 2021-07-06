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

local options = {noremap=true, silent=true}
map("i", "<tab>", "v:lua.tab_complete()", {expr=true})
map("s", "<tab>", "v:lua.tab_complete()", {expr=true})
map("i", "<s-tab>", "v:lua.s_tab_complete()", {expr=true})
map("s", "<s-tab>", "v:lua.s_tab_complete()", {expr=true})
map("i", "<cr>", "compe#confirm('<cr>')", {silent=true, expr=true})
map("i", "jk", "<esc>", options)
map("t", "jk", "<c-\\><c-n>", options)
map("n", ";", ":", {noremap=true})
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
map("n", "<leader>.", "<cmd>lua require('telescope.builtin').file_browser()<cr>", options)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
map("n", "<leader>bl", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
map("n", "<leader>bd", "<cmd>bd!<cr>", options)
map("n", "<leader>x", "<cmd>lua require('telescope.builtin').commands()<cr>", options)
map("n", "<leader>dl", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", options)
map("n", "<leader>dc", "<cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<cr>", options)
map("n", "<leader>dp", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<cr>", options)
map("n", "<leader>dn", "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<cr>", options)
map("n", "<leader>sf", "<cmd>luafile %<cr>", options)  -- source current file
map("n", "<leader>si", "<cmd>luafile /Users/matt/.config/nvim/init.lua<cr>", options)  -- source lua init file
map("n", "<leader>i", "<cmd>edit ~/.config/nvim/init.lua <cr>", options)
map("n", "<leader>e", ":NvimTreeFindFile<cr>", options)
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", options)
map("n", "<leader>pc", "<cmd>PackerClean<cr>", options)
map("n", "gb", "<c-o>", options)
map("n", "gn", "<c-^>", options)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options)  -- go to definition
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", options)  -- go to references
map("n", "gf", "<cmd>lua require('lspsaga.provider').lsp_finder()<cr>", options)
map("n", "gh", "<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>", options)  -- go to hover documentation
map("n", "gs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", options)
map("n", "<leader>a", "<cmd>lua require('lspsaga.codeaction').code_action()<cr>", options)
map("n", "<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<cr>", options)
map("n", "<c-h>", "<c-w>h", options)
map("n", "<c-j>", "<c-w>j", options)
map("n", "<c-k>", "<c-w>k", options)
map("n", "<c-l>", "<c-w>l", options)
map("n", "<leader>tn", "<cmd>TestNearest<cr>", options)
map("n", "<leader>tf", "<cmd>TestFile<cr>", options)
map("n", "<leader>tl", "<cmd>TestLast<cr>", options)
map("n", "<leader>tv", "<cmd>TestVisit<cr>", options)
-- map("n", "<leader>ts", "<cmd>TestSuite<cr>", options)
map("n", "<leader>ts", "<cmd>FloatermNew python /Users/matt/Projects/SimSpace/REDFOR/redfor/tests/run_all_tests.py<cr>", options)
map("n", "<leader>ft", "<cmd>FloatermNew<cr>", options)
map("n", "<leader>v", "<cmd>FloatermNew lazygit<cr>", options)
map("n", "s", "<Plug>(easymotion-s2)", {})
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", options)
map("n", "<s-tab>", "<cmd>BufferLineCyclePrev<CR>", options)
map("n", "gt", "<cmd>BufferLineCycleNext<CR>", options)
map("n", "gT", "<cmd>BufferLineCyclePrev<CR>", options)
map("n", "<leader>o", "<cmd>SymbolsOutline<cr>", options)
map("n", "<leader>sd", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", options)
map("n", "<leader>sw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", options)

-- set up LSP
local on_attach = function(client, _)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,  -- turn off LSP text popups
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

local lsp_install = require('lspinstall')
lsp_install.setup()

local lspconfig = require('lspconfig')
lspconfig.lua.setup {
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
lspconfig.python.setup { on_attach = on_attach }

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

" Toggle wrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
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

require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = { "javascript" },  -- List of parsers to ignore installing
    highlight = {
        enable = true,  -- false will disable the whole extension
        disable = { "c", "rust" },  -- list of language that will be disabled
    },
}

require('lspconfig').pyright.setup{}

require('neoscroll').setup{}

vim.opt.termguicolors = true
require("bufferline").setup{
    options = { always_show_bufferline = false }
}

require('lualine').setup{}

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

require('lspsaga').init_lsp_saga {
  finder_action_keys = {
    open = '<cr>'
  }
}
