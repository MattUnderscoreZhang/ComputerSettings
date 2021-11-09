-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/indent-guides.nvim"
  },
  ["julia-vim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/julia-vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  tabular = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/tabular"
  },
  tagbar = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-arduino"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-arduino"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-flake8"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-flake8"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimspector = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vimspector"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
