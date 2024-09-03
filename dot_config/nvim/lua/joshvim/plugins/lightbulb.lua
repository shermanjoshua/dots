return {
  "kosayoda/nvim-lightbulb",
  config = function()
    local lightbulb = require("nvim-lightbulb")

    lightbulb.setup({
      priority = 10,
      autocmd = {
        enabled = true,
      },
      ignore = {
        ft = { "NvimTree" },
        actions_without_kind = false,
      },
    })
  end,
}
