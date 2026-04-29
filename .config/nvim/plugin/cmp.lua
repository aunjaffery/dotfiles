-- 1. Load the library FIRST and ALONE
vim.pack.add({ { src = "Saghen/blink.lib" } })

-- 2. Load the main plugin SECOND
vim.pack.add({ { src = "Saghen/blink.cmp" } })

-- 3. Safely setup
local ok, blink = pcall(require, 'blink.cmp')
blink.build():wait(60000)
if not ok then return end

blink.setup({
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ['<CR>'] = { 'accept', 'fallback' },
  },

  appearance = {
    nerd_font_variant = 'mono'
  },

  completion = { 
    documentation = { auto_show = true } 
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- Optimal for Fedora/Linux performance
  fuzzy = { implementation = "prefer_rust_with_warning" },
  
  signature = { enabled = true }
})
