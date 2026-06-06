local o = vim.opt
local map = vim.keymap.set

o.number = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.signcolumn = "yes"
o.winborder = "rounded"
o.termguicolors = true
vim.o.background = "dark"
-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

o.wrap = false

o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

o.cursorline = true
vim.opt.showtabline = 2

map("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })
map("n", "H", "<C-w>h", { silent = true })
map("n", "L", "<C-w>l", { silent = true })
-- map("n", "<leader>f", vim.lsp.buf.format)

map("n", "sf", "<Cmd>NvimTreeToggle<CR>")
map("n", "sg", "<Cmd>NvimTreeFindFileToggle<CR>")

--Move selected line
map("v", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

--remaping past to 0register
map("v", "<Leader>y", '"+y', { silent = false })
--deleting without copying
map("n", "x", '"_x', { silent = true })
map("v", "x", '"_x', { silent = true })
map("n", "d", '"_d', { silent = true })
map("v", "d", '"_d', { silent = true })
map("n", "c", '"_c', { silent = true })
map("v", "c", '"_c', { silent = true })

--cut
map("n", "<Leader>d", '""d', { silent = true })
map("v", "<Leader>d", '""d', { silent = true })

pcall(vim.cmd, "command! W w")
pcall(vim.cmd, "command!-bang Q q<bang>")

-- Disable auto-commenting on new lines
local general_group = vim.api.nvim_create_augroup("GeneralSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = general_group,
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "o", "r" })
	end,
})
