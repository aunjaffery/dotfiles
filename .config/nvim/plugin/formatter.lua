vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })
local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		go = { "gofmt", "goimports" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
	},

	format_on_save = nil,
})
vim.keymap.set("n", "<leader>f", function()
	conform.format({
		async = true,
		lsp_fallback = true, -- Falls back to LSP if prettier isn't available
	})
end, { desc = "Format buffer with conform" })
