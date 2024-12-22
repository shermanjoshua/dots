return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    local flash = require("flash")

    flash.setup({
      label = {
        rainbow = {
          enabled = true,
          shade = 7,
        },
      },
      search = {
        enabled = true,
      },
    })

    local keymap = vim.keymap

    -- stylua: ignore start
    keymap.set("n", "ff", function() require("flash").jump() end, { desc = "flash"})
    keymap.set("n", "fr", function() require("flash").remote() end, { desc = "flash remote" })
    keymap.set("n", "ft", function() require("flash").treesitter() end, { desc = "flash treesitter" })
    keymap.set("n", "<c-s>", function() require("flash").toggle() end, { desc = "flash toggle" })
    -- stylua: ignore end
  end,
}
