local map = vim.api.nvim_set_keymap
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
-- splits
map("n", "<c-v>", "<c-w>v", options)  -- split vertically
map("n", "<c-s>", "<c-w>s", options)  -- split horizontally
map("n", "<c-c>", "<c-w>c", options)  -- close split
-- lua config shortcuts
map("n", "<leader>ia", "<cmd>edit ~/.config/nvim/init.lua <cr>", options)
map("n", "<leader>ib", "<cmd>edit ~/.config/nvim/lua/plugins.lua <cr>", options)
map("n", "<leader>ic", "<cmd>edit ~/.config/nvim/lua/mapping.lua <cr>", options)
map("n", "<leader>id", "<cmd>edit ~/.config/nvim/lua/options.lua <cr>", options)
map("n", "<leader>si", "<cmd>luafile ~/.config/nvim/init.lua<cr>", options)  -- source lua init file
-- telescope
map("n", "<leader>fp", ":Telescope projects<cr>", options)
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", options)
map("n", "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>", options)
map("n", "<leader>dl", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", options)
map("n", "<leader>sd", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", options)
map("n", "<leader>sw", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", options)
-- nvim-tree
map("n", "<leader>e", ":NvimTreeFindFile<cr>", options)  -- should get this to call NvimTreeOpen if the buffer is empty
-- packer
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", options)
map("n", "<leader>pc", "<cmd>PackerClean<cr>", options)
-- lsp
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options)  -- go to definition
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", options)  -- go to references
--map("n", "gb", "<c-o>", options)  -- go to references
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)  -- rename object
-- vim-autoformat
map("n", "<leader>af", ":Autoformat<cr>", options)  -- go to references
-- vim-test
map("n", "<leader>tn", "<cmd>TestNearest --verbose<cr>", options)
map("n", "<leader>tf", "<cmd>TestFile<cr>", options)
map("n", "<leader>tl", "<cmd>TestLast<cr>", options)
map("n", "<leader>tv", "<cmd>TestVisit<cr>", options)
map("n", "<leader>ts", "<cmd>TestSuite<cr>", options)
-- REDFOR-specific shortcuts
--map("n", "<leader>ts", "<cmd>FloatermNew python /Users/matt/Projects/SimSpace/REDFOR/redfor/tests/run_all_tests.py<cr>", options)
map("n", "<leader>tp", ":FloatermNew python " .. vim.api.nvim_buf_get_name(0) .. "<cr>", options)  -- execute main function of current file
map("n", "<leader>of", "<cmd>:term cd /Users/matt/Projects/SimSpace/REDFOR/; ./run_frontend.sh<cr>", options)
map("n", "<leader>ob", "<cmd>:term cd /Users/matt/Projects/SimSpace/REDFOR/; ./run_backend.sh<cr>", options)
map("n", "<leader>ol", "<cmd>:term cd /Users/matt/Projects/SimSpace/REDFOR/attack-designer/; open http://localhost:1234<cr>", options)
-- lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", options)
-- vim-easymotion
map("n", "f", "<Plug>(easymotion-sn)", {})
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
-- flutter stuff
map("n", "<leader>ftt", "<cmd>FloatermNew flutter test " .. vim.api.nvim_buf_get_name(0) .. "<cr>", options)
map("n", "<leader>fta", "<cmd>FloatermNew flutter test <cr>", options)
map("n", "<leader>fbr", "<cmd>!flutter packages pub run build_runner build<cr>", options)
-- gitsigns
map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", options)
-- copilot
map("n", "<leader>cp", ":Copilot panel<cr>", options)

---- calculator via bash bc
---- don't redefine these functions on config reload
--vim.cmd([[
--function! MyCalc(str)
--return system("echo 'x=" . a:str . ";d=.5/10^" . g:MyCalcPrecision
--\. ";if (x<0) d=-d; x+=d; scale=" . g:MyCalcPrecision . ";print x/1' | bc -l")
--endfunction

--function! DayCalcPercent(str)
--return system("echo -n \\\(; echo 'x=(" . a:str . ")*100;d=.5/10^" . g:MyCalcPrecision
--\. ";if (x<0) d=-d; x+=d; scale=" . g:MyCalcPrecision . ";print x/1' | bc -l; echo -n \\\%\\\)")
--endfunction

--function! MyCalcNoRound(str)
--return system("echo 'scale=" . g:MyCalcPrecision . " ; print " . a:str . "' | bc -l")
--endfunction

--let g:MyCalcPrecision = 2  " Control the precision with this variable

--map <silent> <leader>cr :s/\$\(.*\)\$/\=MyCalc(submatch(1))/g<CR>:noh<CR>
--map <silent> <leader>cp :s/\$\(.*\)\$/\=DayCalcPercent(submatch(1))/g<CR>:noh<CR>
--]])

-- cycle case of highlighted words with ~
vim.cmd([[
function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
        let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
        let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
        let result = toupper(a:str)
    endif
    return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
]])
