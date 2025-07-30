vim.o.number = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"

local map = vim.keymap.set

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
    end
  end,
})
require("config.lazy")
