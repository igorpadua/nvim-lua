local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

-- General Setup
opt.number = true
opt.title = true
opt.modeline = true
opt.laststatus = 3
opt.showtabline = 2
opt.showmode = false

-- Theme
opt.termguicolors = true
require('github-theme').setup({theme_style= "dimmed"})

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
require('lsp_config')

-- Formatar ao salvar
cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])

-- Suprimir erro clangd
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    notify(msg, ...)
end

-- Identação
cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

cmd([[
  hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFFFF
  let g:indentLine_fileTypeExclude = ['dashboard']
]])

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",

    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent0",
    },
}
