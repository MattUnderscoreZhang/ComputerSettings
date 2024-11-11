local map = vim.api.nvim_set_keymap
local options = {noremap=true, silent=true}

vim.g.mapleader = ";"

-- built-in
map("n", "<space><space>", "za", options)
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
--map("n", "<leader>m", "`", options)
-- splits
map("n", "<c-v>", "<c-w>|", options)  -- split vertically
map("n", "<c-s>", "<c-w>-", options)  -- split horizontally
map("n", "<c-c>", "<c-w>w", options)  -- close split
-- lua config shortcuts
map("n", "<leader>ia", "<cmd>edit ~/.config/nvim/init.lua <cr>", options)
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
-- vim-autoformat
map("n", "<leader>af", ":Autoformat<cr>", options)  -- go to references
-- vim-test
map("n", "<leader>tn", "<cmd>TestNearest --verbose<cr>", options)
map("n", "<leader>tf", "<cmd>TestFile<cr>", options)
map("n", "<leader>tl", "<cmd>TestLast<cr>", options)
map("n", "<leader>tv", "<cmd>TestVisit<cr>", options)
map("n", "<leader>ts", "<cmd>TestSuite<cr>", options)
-- floaterm
map("n", "<leader>tt", "<cmd>FloatermNew<cr>", options)
map("n", "<leader>tp", ":FloatermNew python " .. vim.api.nvim_buf_get_name(0) .. "<cr>", options)  -- execute main function of current file
-- lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", options)
-- vim-easymotion
map("n", "/", "<Plug>(easymotion-sn)", {})
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
--map("n", "<leader>fxd", ":FlutterRun --debug -d web-server --web-hostname localhost --web-port 3000<cr>", options)
--map("n", "<leader>fxr", ":FlutterRun --release -d web-server --web-hostname localhost --web-port 3000<cr>", options)
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
map("n", "<leader>b", ":Gitsigns toggle_current_line_blame<cr>", options)
-- copilot
map("n", "<leader>cp", ":Copilot panel<cr>", options)
-- limelight
map("n", "<leader>ll", ":Limelight!!<cr>", options)
-- ruff-lsp + built-in lsp (see `:help vim.lsp.*` for documentation)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options)  -- go to definition
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", options)  -- go to references
map("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>", options)  -- info about object
map("n", "<leader>p", "<cmd>lua vim.lsp.buf.peek_definition()<CR>", options)  -- info about object
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", options)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", options)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", options)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", options)
map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", options)
map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", options)
map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", options)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", options)
map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", options)
map("n", "<leader>f", ":echo 'Code formatted'<cr><cmd>lua vim.lsp.buf.format { async = false }<cr>", options)
-- oil
map("n", "-", "<CMD>Oil --float<CR>", options)
