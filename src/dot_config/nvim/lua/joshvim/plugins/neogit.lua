return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require("neogit")
    local keymap = require("vim.keymap")

    neogit.setup({})
    keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Start Neogit" })
    keymap.set("n", "<leader>go", "<cmd>Neogit kind=vsplit<cr>", { desc = "Open in vsplit" })
    -- keymap.set("n", "<C-j>", "", { desc = "Open in vsplit" })
    -- keymap.set("n", "<C-k>", "", { desc = "Open in vsplit" })
  end,
}
