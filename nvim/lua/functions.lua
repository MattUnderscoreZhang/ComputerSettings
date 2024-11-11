-- Load all functions in the ~/.config/nvim/lua/functions/ directory.

local function_dir = vim.fn.stdpath('config') .. '/lua/functions'
local functions = vim.fn.readdir(function_dir)
for _, function_def in ipairs(functions) do
    if vim.fn.isdirectory(function_dir .. '/' .. function_def) == 0 then  -- skip directories
        require('functions.' .. function_def:gsub("%.lua$", ""))
    end
end
