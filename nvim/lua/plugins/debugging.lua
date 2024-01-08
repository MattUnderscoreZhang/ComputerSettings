local M = {}

M.setup = function(use)
    use 'puremourning/vimspector'  -- graphical debugger
    use 'sakhnik/nvim-gdb' -- GDB, LLDB, pdb++ integration
    use 'kkharji/lspsaga.nvim'  -- error diagnostics on hover (maintained branch of original lspsaga)
end

--make error pop up on hovering a cursor over it
--NOTE: currently doesn't work because window popup is bugged
--vim.cmd([[
    --autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()
--]])

return M
