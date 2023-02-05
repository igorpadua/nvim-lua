local status, packer = pcall(require, "packer")
if not status then
   print("Packer is not installed")
   return
end

vim.cmd [[packadd packer.nvim]]

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

packer.startup(function(use)

   -- Instalador de pacotes
   use("wbthomason/packer.nvim")

   -- Tema
   use 'navarasu/onedark.nvim'

   -- Gerenciador de arquivos
   use("nvim-tree/nvim-tree.lua")

   -- Icones
   use("ryanoasis/vim-devicons")
   use("kyazdani42/nvim-web-devicons")

   -- Substitui caracteres
   use("tpope/vim-surround")

   -- AutoPairs
   use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
   }

   -- Syntax Highlight
   use("sheerun/vim-polyglot")

   -- Barra de status
   use("nvim-lualine/lualine.nvim")

   -- Exibir cores
   use("norcalli/nvim-colorizer.lua")

   -- Identação
   use("lukas-reineke/indent-blankline.nvim")

   -- Formatação
   use("lukas-reineke/lsp-format.nvim")

   -- Comentar
   use("terrortylor/nvim-comment")

   -- Telescope
   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
   }

   -- LSP
   use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
         -- LSP Support
         {'neovim/nvim-lspconfig'},
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},

         -- Autocompletion
         {'hrsh7th/nvim-cmp'},
         {'hrsh7th/cmp-nvim-lsp'},
         {'hrsh7th/cmp-buffer'},
         {'hrsh7th/cmp-path'},
         {'saadparwaiz1/cmp_luasnip'},
         {'hrsh7th/cmp-nvim-lua'},

         -- Snippets
         {'L3MON4D3/LuaSnip'},
         {'rafamadriz/friendly-snippets'},
      }
   }
   use("github/copilot.vim")
   use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
   use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
   use("ray-x/lsp_signature.nvim")

   -- Java
   use('mfussenegger/nvim-jdtls')

   if packer_bootstrap then
      packer.sync()
   end

end)
