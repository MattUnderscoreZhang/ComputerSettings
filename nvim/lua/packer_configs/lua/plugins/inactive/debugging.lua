local M = {}

M.setup = function(use)
    use 'puremourning/vimspector'  -- graphical debugger
    use 'sakhnik/nvim-gdb' -- GDB, LLDB, pdb++ integration
end

return M
