-- Sair
vim.keymap.set('n', '<leader>q', ':quit <CR>', {})

-- Gerenciador de Arquivos
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle <CR>', {})
vim.keymap.set('n', '<C-f>', ':NvimTreeFind <CR>', {})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Bufferline
vim.keymap.set('n', '<leader>bn', ':BufferLineCycleNext <CR>', {})
vim.keymap.set('n', '<leader>bp', ':BufferLineCyclePrev <CR>', {})
vim.keymap.set('n', '<leader>q', ':BufferLinePickClose <CR>', {})
