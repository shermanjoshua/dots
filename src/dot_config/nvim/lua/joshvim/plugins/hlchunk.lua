return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local hlchunk = require("hlchunk")

    hlchunk.setup({
      chunk = {
        enable = true,
        style = "#00ffff",
      },
    })
  end,
}
