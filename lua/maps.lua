local set = vim.api.nvim_set_keymap
local ns = {noremap = true, silent = true}
local cmd = vim.cmd

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Sair
map('n', 'q', ':quit <CR>', opt)

-- Gerenciador de Arquivos
map('n', '<C-n>', ':NvimTreeToggle <CR>', opt)
map('n', '<C-f>', ':NvimTreeFind <CR>', opt)
