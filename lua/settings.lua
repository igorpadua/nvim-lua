local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})
local autocmd = vim.api.nvim_create_autocmd

-- General Setup
vim.opt.number = true
vim.opt.title = true
vim.opt.modeline = true
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.showmode = false

-- Theme
vim.opt.termguicolors = true
require('onedark').load()

-- Editor
vim.opt.mouse = "a"
vim.opt.cursorline = true

-- Barra de Status
vim.cmd([[ let extension = expand('%:e') ]])

-- Require
require("mason").setup()
require'colorizer'.setup()
require('nvim-web-devicons').get_icons()
require('nvim_comment').setup()
require("lsp-format").setup {}
require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }
require('lualine').setup {options = { theme = 'onedark' }}

-- Suprimir erro clangd
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    notify(msg, ...)
end

-- Erro BufWritePre
autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
