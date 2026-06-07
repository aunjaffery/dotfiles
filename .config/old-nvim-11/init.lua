local o = vim.opt
local map = vim.keymap.set

o.number = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.signcolumn = "yes"
o.winborder = "rounded"
o.termguicolors = true
-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

o.wrap = false

o.ignorecase = true -- ignore case when searching
o.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

o.cursorline = true


map("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })
map("n", "H", "<C-w>h", { silent = true })
map("n", "L", "<C-w>l", { silent = true })
map("n", "<leader>f", vim.lsp.buf.format)

map('n', 'J', '<Cmd>BufferPrevious<CR>')
map('n', 'K', '<Cmd>BufferNext<CR>')
map('n', 'D', '<Cmd>BufferClose<CR>')
map('n', '<C-S-Left>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<C-S-Right>', '<Cmd>BufferMoveNext<CR>')

--Move selected line
map("v", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

--remaping past to 0register
map("v", "<Leader>y", '"+y', { silent = false })
--deleting without copying
map("n", "x", '"_x', { silent = true })
map("n", "d", '"_d', { silent = true })
map("v", "d", '"_d', { silent = true })
map("n", "c", '"_c', { silent = true })
map("v", "c", '"_c', { silent = true })

--cut
map("n", "<Leader>d", '""d', { silent = true })
map("v", "<Leader>d", '""d', { silent = true })

pcall(vim.cmd, "command! W w")
pcall(vim.cmd, "command!-bang Q q<bang>")

vim.api.nvim_create_autocmd("FileType", {
  group = autogroup,
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "o", "r" })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.definitionProvider then
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
      vim.keymap.set('n', "<C-k>", vim.lsp.buf.hover, { buffer = args.buf, desc = "hover" })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    end
  end,
})

require("config.lazy")
