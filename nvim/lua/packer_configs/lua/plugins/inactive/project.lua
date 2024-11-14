local M = {}

-- Save project locations in nvim and jump to them with a floating popup.

M.setup = function(use)
    use 'ahmedkhalf/project.nvim'
    require("project_nvim").setup {}
    require("telescope").load_extension('projects')
end

return M
