vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
  -- Plugins Manager
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- UI/UX
  use 'MunifTanjim/nui.nvim'
  use 'yuttie/comfortable-motion.vim'
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x'
  }
  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-web-devicons').setup() end
  }
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function() require('toggleterm').setup() end
  }
  use {
    'startup-nvim/startup.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function() require('startup').setup() end
  }

  -- Colorscheme
  use 'jdsimcoe/abstract.vim'

  -- Language Server Protocol
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'ray-x/lsp_signature.nvim'
  use {
    'williamboman/mason.nvim',
    requires = { 'williamboman/mason-lspconfig.nvim' },
    config = function() require('mason').setup() end
  }

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  }
  use {
    'kaarmu/typst.vim',
    ft = { 'typst' }
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    tag = 'v1.*',
    run = 'make install_jsregexp'
  }

  -- Copilot
  use {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false }
      })
    end
  }
  use {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end
  }
end)
