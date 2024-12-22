return {
  "fedepujol/move.nvim",
  config = function()
    local move = require("move")
    move.setup({})

    local map = vim.keymap

    map.set("x", "<A-j>", ":MoveBlock(1)<CR>", { desc = "move block down (v)" })
    map.set("x", "<A-k>", ":MoveBlock(-1)<CR>", { desc = "move block up (v)" })
  end,
}
