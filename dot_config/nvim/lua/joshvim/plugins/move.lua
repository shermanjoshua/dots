return {
  "fedepujol/move.nvim",
  config = function()
    local move = require("move")
    move.setup({})

    local map = vim.keymap
    local opts = { noremap = true, silent = true }

    map.set("x", "<A-j>", ":MoveBlock(1)<CR>", opts)
    map.set("x", "<A-k>", ":MoveBlock(-1)<CR>", opts)
    map.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
    map.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)
  end,
}
