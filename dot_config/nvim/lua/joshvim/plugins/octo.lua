return {
  "pwntester/octo.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local octo = require("octo")

    octo.setup({
      enable_builtin = true,
    })
    local keymap = require("vim.keymap")
    local opts = { buffer = true, silent = true }

    keymap.set("n", "<leader>pr", ":Octo pr list<cr>", opts)
    keymap.set("i", "@", "@<C- x><C-o>", opts)
    keymap.set("i", "#", "#<C-x><C-o>", opts)
  end,
}
