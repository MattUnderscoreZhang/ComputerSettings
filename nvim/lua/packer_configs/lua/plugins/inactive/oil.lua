local M = {}

-- Open a folder in a buffer to edit it like a file.
-- Supposedly, any moved or renamed files will auto-update imported dependencies in a project.
-- However, I haven't been able to get this to work.

M.setup = function(use)
    use 'stevearc/oil.nvim'
    require("oil").setup({
        float = {
            padding = 5,
            max_width = 80,
        },
    })
end

return M
