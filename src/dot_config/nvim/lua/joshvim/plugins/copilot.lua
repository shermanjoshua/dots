return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    local copilot = require("copilot")

    copilot.setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
      },
    })
    local keymap = vim.keymap

    keymap.set("i", "<M-[>", "[[", { desc = "Jump to previous suggestion" })
    keymap.set("i", "<M-]>", "]]", { desc = "Jump to next suggestion" })
    keymap.set("i", "<M-]>", "]]", { desc = "Jump to next suggestion" })
    keymap.set("i", "<M-CR>", require("copilot.suggestion").accept, { desc = "Accept suggestion" })
  end,
}
