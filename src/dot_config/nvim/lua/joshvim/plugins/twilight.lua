return {
  "folke/twilight.nvim",
  config = function()
    local twilight = require("twilight")

    twilight.setup({
      exclude = { "NvimTree", "vista", "terminal", "packer", "qf" },
    })
  end,
}
