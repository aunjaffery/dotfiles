vim.pack.add({
	{ src = "https://github.com/akinsho/bufferline.nvim" },
})

require("bufferline").setup({
	options = {
		mode = "buffers",
		separator_style = "slope",
		show_buffer_close_icons = false,
		show_close_icon = false,
		always_show_bufferline = true,
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "󰙅 File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})

local map = vim.keymap.set
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "J", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "K", ":BufferLineCycleNext<CR>", { silent = true })
-- map("n", "D", ":bd<CR>", { silent = false })
map("n", "<C-S-Left>", ":BufferLineMovePrev<CR>", { silent = true })
map("n", "<C-S-Right>", ":BufferLineMoveNext<CR>", { silent = true })
map("n", "D", function()
	local buffer_id = vim.fn.bufnr()
	vim.cmd("BufferLineCyclePrev")
	vim.cmd("bdelete " .. buffer_id)
end, { desc = "Close current buffer and go to previous" })
