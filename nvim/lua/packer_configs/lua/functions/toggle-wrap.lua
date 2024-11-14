-- Toggle line wrap.

vim.cmd([[
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
]])

local map = vim.api.nvim_set_keymap
local options = {noremap=true, silent=true}
map("n", "<leader>w", ":call ToggleWrap()<cr>", options)
