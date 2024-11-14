local M = {}

M.setup = function(use)
    use 'simrat39/symbols-outline.nvim'  -- code tree view sidebar (*)
    use 'majutsushi/tagbar'  -- code tree viewer sidebar (*)
    use 'jremmen/vim-ripgrep'  -- allows using ripgrep inside vim
end

return M
