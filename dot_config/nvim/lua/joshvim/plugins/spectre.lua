return {
  "nvim-pack/nvim-spectre",
  pin = true,
  config = function()
    local spectre = require("spectre")

    spectre.setup({
      is_block_ui_break = true,
      default = {
        find = {
          cmd = "rg",
          options = { "ignore-case" },
        },
        replace = {
          cmd = "sed",
        },
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>fh", "<cmd>Spectre<cr>", { desc = "Find/Replace (Spectre)" })
  end,
}
