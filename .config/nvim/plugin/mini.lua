vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "nvim-tree/nvim-web-devicons" },
})

-- require("mini.tabline").setup({
-- 	show_icons = true,
-- 	set_vim_settings = true,
-- })
require("mini.pairs").setup({})
require("mini.animate").setup({})
-- To get behavior closest to ‘tpope/vim-surround’
require('mini.surround').setup({
  mappings = {
    add = 'ys',
    delete = 'ds',
    find = '',
    find_left = '',
    highlight = '',
    replace = 'cs',

    -- Add this only if you don't want to use extended mappings
    suffix_last = '',
    suffix_next = '',
  },
  search_method = 'cover_or_next',
})

vim.keymap.del('x', 'ys')
vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { silent = true })
--
