local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function verify_packer_installed()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Themes
  use {
    'folke/tokyonight.nvim',
    config = function ()
      require'nvg.plugins.tokyonight'.init()
    end
  }

end

local function init()
  verify_packer_installed()
  packer_startup()
end

return 
{
  init = init
}
