vim.pack.add({ { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } })
require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = false,
	integrations = {
		nvimtree = true,
		treesitter = true,
		mini = { enabled = true },
		bufferline = true,
		indent_blankline = { enabled = true },
		telescope = { enabled = true },
	},
})

vim.cmd.colorscheme("catppuccin-mocha")
