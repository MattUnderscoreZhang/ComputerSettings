local M = {}

M.setup = function(use)
    use 'simrat39/symbols-outline.nvim'  -- code tree view sidebar (*)
    use 'majutsushi/tagbar' -- code tree viewer sidebar (*)
    use 'karb94/neoscroll.nvim'  -- smooth window scrolling
    use 'jremmen/vim-ripgrep'  -- allows using ripgrep inside vim
    use 'nacro90/numb.nvim' -- line number peaking
    use 'ahmedkhalf/project.nvim'  -- project management and navigation
    use {
        'romgrk/barbar.nvim',  -- buffer control
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'famiu/bufdelete.nvim' -- cleaner buffer closing
end

require('neoscroll').setup{}
require("bufdelete")
require('numb').setup()
require("project_nvim").setup {}
require("telescope").load_extension('projects')

return M
