return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = vim.o.columns * 0.4,
        direction = "vertical",
        insert_mapping = true,
      })
      local map = vim.keymap.set
      map("n", "<leader>t", "<cmd>ToggleTerm<CR>", { silent = true })
      map("t", "<leader>t", "<cmd>ToggleTerm<CR>", { silent = true })
      map("t", "<Esc>", "<C-\\><C-n>", { silent = true })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = { char = "┊" },
      scope = { enabled = false }
    },
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = true
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local autotag = require("nvim-ts-autotag")
      autotag.setup({
        autotag = {
          enable = true
        }
      })
    end
  }
}
