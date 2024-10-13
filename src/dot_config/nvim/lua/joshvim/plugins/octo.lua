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
      suppress_missing_scope = {
        projects_v2 = true,
      },
    })
    local keymap = require("vim.keymap")

    keymap.set("n", "<leader>pr", ":Octo pr list<cr>", { desc = "pr list", buffer = true, silent = true })
    keymap.set("i", "@", "@<C- x><C-o>", { desc = "@ in insert", buffer = true, silent = true })
    keymap.set("i", "#", "#<C-x><C-o>", { desc = "# in insert", buffer = true, silent = true })
  end,
}
