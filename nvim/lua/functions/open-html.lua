vim.keymap.set(
    'n',
    '<leader>oh',
    function()
        local file_path = vim.fn.expand('%:p') -- Get full path of the current file
        if file_path:match('%.html$') then
            vim.fn.system('open ' .. file_path) -- Use `xdg-open` for Linux
        else
            print("Not an HTML file")
        end
    end,
    { desc = "Open current HTML file in browser" }
)
