vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.del('n', 's', { buffer = bufnr })
  vim.keymap.del('n', 'f', { buffer = bufnr })
  vim.keymap.del('n', 'L', { buffer = bufnr })
  vim.keymap.del('n', 'H', { buffer = bufnr })
  vim.keymap.set('n', "+", api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', "-", api.tree.change_root_to_parent, opts('UP'))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
})
