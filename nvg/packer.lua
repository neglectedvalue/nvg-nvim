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

  -- Sessions
  use {
    'rmagatti/auto-session',
    config = function ()
      require'nvg.plugins.auto_session'.init()
    end
  }

  -- Git Support
  use 'rhysd/git-messenger.vim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require'nvg.plugins.gitsigns'.init()
    end
  }
  
  -- Telescope
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'rmagatti/session-lens',
    config = function ()
      require'nvg.plugins.telescope'.init()
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
    config = function () 
      require'nvg.plugins.treesitter'.init()
    end
  }

  -- Utils
  use 'unblevable/quick-scope'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'hoob3rt/lualine.nvim',
    config = function ()
      require'nvg.plugins.lualine'.init()
    end
  }
  use 'preservim/nerdcommenter'
  use 'romgrk/nvim-treesitter-context'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'voldikss/vim-floaterm',
    config = function ()
      require'nvg.plugins.floaterm'.init()
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
