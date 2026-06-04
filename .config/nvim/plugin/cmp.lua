-- 1. Load nvim-cmp and all its dependencies via pack
vim.pack.add({ { src = "https://github.com/hrsh7th/nvim-cmp" } })
vim.pack.add({ { src = "https://github.com/hrsh7th/cmp-nvim-lsp" } })
vim.pack.add({ { src = "https://github.com/hrsh7th/cmp-buffer" } })
vim.pack.add({ { src = "https://github.com/hrsh7th/cmp-path" } })
vim.pack.add({ { src = "https://github.com/saadparwaiz1/cmp_luasnip" } })
vim.pack.add({ { src = "https://github.com/onsails/lspkind.nvim" } })

-- Load LuaSnip and friendly-snippets collection
vim.pack.add({ { src = "https://github.com/L3MON4D3/LuaSnip" } })
vim.pack.add({ { src = "https://github.com/rafamadriz/friendly-snippets" } })

-- 2. Safely protect the setup
local cmp_ok, cmp = pcall(require, "cmp")
local luasnip_ok, luasnip = pcall(require, "luasnip")
local lspkind_ok, lspkind = pcall(require, "lspkind")

if not (cmp_ok and luasnip_ok and lspkind_ok) then
	return
end

-- 3. Load VS-Code style snippets (friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()

-- Custom floating window borders definition
local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

-- 4. Configure nvim-cmp
cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	window = {
		completion = {
			border = border("CmpBorder"),
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
		},
		documentation = {
			border = border("CmpDocBorder"),
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- Forces menu open on empty files
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp", keyword_length = 1 }, -- Aggressive wake up for gopls
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
