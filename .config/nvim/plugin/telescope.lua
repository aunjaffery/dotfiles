-- plugin/telescope.lua
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim"},
  { src = "https://github.com/nvim-telescope/telescope.nvim"},
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
})

local telescope = require('telescope')

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})

telescope.load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'F', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>s', builtin.grep_string, { desc = 'grep_string' })
