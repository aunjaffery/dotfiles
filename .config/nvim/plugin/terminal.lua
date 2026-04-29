vim.pack.add({
  { src = 'https://github.com/akinsho/toggleterm.nvim' },
})

require("toggleterm").setup({
  -- Matches your old 40% width vertical preference
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<leader>t]], -- This handles both opening and closing
  direction = "vertical",
  insert_mappings = true,
  terminal_mappings = true,
  persist_mode = true,
})
local map = vim.keymap.set
map("t", "<Esc>", [[<C-\><C-n>]], { silent = true })
