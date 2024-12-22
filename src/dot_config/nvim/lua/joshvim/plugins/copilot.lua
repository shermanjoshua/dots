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
      copilot_node_command = "/usr/local/bin/node",
    })
    local keymap = vim.keymap

    keymap.set("i", "<M-[>", "[[", { desc = "jump to previous suggestion" })
    keymap.set("i", "<M-]>", "]]", { desc = "jump to next suggestion" })
    keymap.set("i", "<M-]>", "]]", { desc = "jump to next suggestion" })
    keymap.set("i", "<tab>", require("copilot.suggestion").accept, { desc = "accept suggestion" })
  end,
}
