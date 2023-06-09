-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
  })

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      }
    }
  })

