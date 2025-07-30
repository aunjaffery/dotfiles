return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = { enabled = true },
    scroll = { enabled = true },
    terminal = { enabled = false }
  },
  keys = {
    { "sf",        function() Snacks.explorer({ follow_file = false }) end, desc = "File Explorer" },
    { "sg",        function() Snacks.explorer({ follow_file = true }) end,  desc = "File Explorer" },
    { "F",         function() Snacks.picker.files() end,                    desc = "Find Files" },
    { "<leader>g", function() Snacks.picker.grep() end,                     desc = "Grep" },
    { "<leader>s", function() Snacks.picker.grep_word() end,                desc = "Visual selection or word", mode = { "n", "x" } },
  }
}
