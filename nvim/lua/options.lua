local o = vim.o  -- global options
local wo = vim.wo  -- window option
local bo = vim.bo  -- buffer settings
local g = vim.g
local cmd = vim.cmd
local opt = vim.opt

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
g.python3_host_prog = "/Users/matt/.pyenv/shims/python"

o.termguicolors = true
opt.termguicolors = true
cmd([[colorscheme everforest]])

-- for CharaChorder
g.mapleader = ";"

-- nvim-gdb
g.loaded_nvimgdb = 1  -- disable

-- indent-blankline
opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

-- lspsaga
cmd([[autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()]])  -- make error pop up on hovering a cursor over it

-- vim-test
cmd([[let test#python#pytest#options = '-s']])  -- make vim-test print out to terminal
cmd([[let test#strategy = "neovim"]])  -- make vim-test use split window

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

-- disable folding on startup (zi to enable)
cmd([[autocmd! FileType text setlocal foldmethod=indent]])
vim.api.nvim_exec([[set foldenable!]], false)

-- no inline error messages
vim.diagnostic.config({virtual_text = false, underline = false})

-- error and warning icons in gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- word wrap for txt files
vim.api.nvim_command("augroup wrap_txt")
vim.api.nvim_command("    autocmd!")
vim.api.nvim_command("    autocmd FileType txt setlocal textwidth=0")
vim.api.nvim_command("    autocmd FileType txt setlocal wrapmargin=0")
vim.api.nvim_command("    autocmd FileType txt setlocal linebreak")
vim.api.nvim_command("    autocmd FileType txt setlocal columns=80")
vim.api.nvim_command("augroup END")
