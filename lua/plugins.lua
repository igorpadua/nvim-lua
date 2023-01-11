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
   use("projekt0n/github-nvim-theme")

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

   -- Linter
   use("github/copilot.vim")
   use("honza/vim-snippets")

   -- Syntax Highlight
   use("sheerun/vim-polyglot")

   -- Barra de status
   use("tamton-aquib/staline.nvim")

   -- Exibir cores
   use("norcalli/nvim-colorizer.lua")

   -- Identação
   use("lukas-reineke/indent-blankline.nvim")

   -- Formatação
   use("lukas-reineke/lsp-format.nvim")

   -- Comentar
   use("terrortylor/nvim-comment")

   -- LSP
   use("neovim/nvim-lspconfig")
   use("hrsh7th/nvim-cmp")
   use("hrsh7th/cmp-nvim-lsp")
   use("hrsh7th/cmp-buffer")
   use("hrsh7th/cmp-path")
   use("hrsh7th/cmp-cmdline")
   use("saadparwaiz1/cmp_luasnip")
   use("L3MON4D3/LuaSnip")
   use("rafamadriz/friendly-snippets")
   use("ray-x/lsp_signature.nvim")
   use({"tzachar/cmp-tabnine", run="./install.sh", requires = "hrsh7th/nvim-cmp"})
   use("onsails/lspkind-nvim")
   use("williamboman/mason.nvim")

   -- Java
   use('mfussenegger/nvim-jdtls')

   if packer_bootstrap then
      packer.sync()
   end

end)
