-- Toggle writing mode, which creates new panels around the writing area.
-- Bug: Toggling writing mode creates a new buffer.
-- Bug: New panels are not invisible.

vim.cmd([[
    let g:dfm_width = 80 "absolute width or percentage, like 0.7
    let g:dfm_height = 0.8

    let s:dfm_enabled = 0

    function! ToggleWritingMode()
        let l:w = g:dfm_width > 1 ? g:dfm_width : (winwidth('%') * g:dfm_width)
        let l:margins = {
            \ "l": ("silent leftabove " . float2nr((winwidth('%') - l:w) / 2 - 1) . " vsplit new"),
            \ "h": ("silent rightbelow " . float2nr((winwidth('%') - l:w) / 2 - 1) . " vsplit new"),
            \ "j": ("silent leftabove " . float2nr(winheight('%') * (1 - g:dfm_height) / 2 - 1) . " split new"),
            \ "k": ("silent rightbelow " . float2nr(winheight('%') * (1 - g:dfm_height) / 2 - 1) . " split new"),
        \ }
        if (s:dfm_enabled == 0)
            echo "Writing mode ON"
            let s:dfm_enabled = 1
            for key in keys(l:margins)
                execute l:margins[key] . " | wincmd " . key
            endfor
            for key in ['NonText', 'VertSplit', 'StatusLine', 'StatusLineNC']
                execute 'hi ' . key . ' ctermfg=bg ctermbg=bg cterm=NONE'
            endfor
            set wrap | set linebreak
            map j gj
            map k gk
        else
            echo "Writing mode OFF"
            let s:dfm_enabled = 0
            for key in keys(l:margins)
                execute "wincmd " . key . " | close "
            endfor
            set nowrap | set nolinebreak
            unmap j
            unmap k
        endif
    endfunction
]])

local map = vim.api.nvim_set_keymap
local options = {noremap=true, silent=true}
map("n", "<leader>z", ":call ToggleWritingMode()<cr>", options)
