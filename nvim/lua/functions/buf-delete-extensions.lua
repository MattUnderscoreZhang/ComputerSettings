vim.api.nvim_set_keymap(
    'n',
    'bd',
    "<cmd>Bwipeout!<cr>",
    {
        noremap=true,
        silent=true,
        desc = "Close current buffer",
    }
)

vim.keymap.set(
    'n',
    'bl',
    function()
        local bufs = vim.api.nvim_list_bufs()
        local current_buf = vim.api.nvim_get_current_buf()
        for i = 1, #bufs do
            local buf = bufs[i]
            if buf ~= current_buf then
                vim.cmd('bwipeout! ' .. buf)
            else
                break
            end
        end
    end,
    {
        noremap=true,
        silent=true,
        desc = "Close buffers to the left",
    }
)

vim.keymap.set(
    'n',
    'br',
    function()
        local bufs = vim.api.nvim_list_bufs()
        local current_buf = vim.api.nvim_get_current_buf()
        for i = #bufs, 1, -1 do
            local buf = bufs[i]
            if buf ~= current_buf then
                vim.cmd('bwipeout! ' .. buf)
            else
                break
            end
        end
    end,
    {
        noremap=true,
        silent=true,
        desc = "Close buffers to the right",
    }
)

vim.keymap.set(
    'n',
    'ba',
    function()
        local bufs = vim.api.nvim_list_bufs()
        local current_buf = vim.api.nvim_get_current_buf()
        for i = 1, #bufs do
            local buf = bufs[i]
            if buf ~= current_buf then
                vim.cmd('bwipeout! ' .. buf)
            end
        end
    end,
    {
        noremap=true,
        silent=true,
        desc = "Close all other buffers",
    }
)
