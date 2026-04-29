vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"gopls",
		"pyright",
		"bashls",
		"yamlls",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = { "prettier", "stylua", "gofumpt" },
})

vim.lsp.enable({ "bashls", "gopls", "lua_ls", "ts_ls" })

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.definitionProvider then
			-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf, desc = "LSP: Find References" })
			vim.keymap.set(
				"n",
				"gi",
				vim.lsp.buf.implementation,
				{ buffer = args.buf, desc = "LSP: Go to Implementation" }
			)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { buffer = args.buf, desc = "hover" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set(
				"n",
				"gd",
				require("telescope.builtin").lsp_definitions,
				{ buffer = args.buf, desc = "Telescope: Definition" }
			)
			vim.keymap.set(
				"n",
				"gr",
				require("telescope.builtin").lsp_references,
				{ buffer = args.buf, desc = "Telescope: References" }
			)
		end
	end,
})
