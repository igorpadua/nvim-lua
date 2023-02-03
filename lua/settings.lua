local opt = vim.opt
local cmd = vim.cmd

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})
local autocmd = vim.api.nvim_create_autocmd

-- General Setup
opt.number = true
opt.title = true
opt.modeline = true
opt.laststatus = 3
opt.showtabline = 2
opt.showmode = false

-- Theme

opt.termguicolors = true
require('onedark').load()

-- Editor
opt.mouse = "a"
opt.cursorline = true

-- Barra de Status
cmd([[ let extension = expand('%:e') ]])

-- Require
require("mason").setup()
require('staline').setup()
require'colorizer'.setup()
require('nvim-web-devicons').get_icons()
require('nvim_comment').setup()
require("lsp-format").setup {}
require("lspconfig").gopls.setup { on_attach = require("lsp-format").on_attach }

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
