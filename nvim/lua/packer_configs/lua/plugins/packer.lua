local M = {}

-- Package manager for nvim plugins.
-- Needs to be manually installed first with "git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim".
-- This is here so Packer doesn't uninstall itself when scanning for "use".

M.setup = function(use)
    use 'wbthomason/packer.nvim'
    require("packer").init {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }  -- have Packer use a popup window
            end,
        },
    }
end

return M
