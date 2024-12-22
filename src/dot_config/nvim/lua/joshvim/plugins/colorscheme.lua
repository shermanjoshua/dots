return {
  "sontungexpt/witch",
  priority = 1000,
  lazy = false,

  config = function()
    local witch = require("witch")

    witch.setup({
      theme = {
        enabled = true,
        style = "dark",
        extras = {
          bracket = true,
          dashboard = true,
          diffview = true,
          indentline = true,
        },
      },
      dim_inactive = {
        enabled = true,
        level = 0.5,
        excluded = {
          filetypes = {
            NvimTree = true,
          },
          buftypes = {
            nofile = true,
            prompt = true,
          },
        },
      },
      switcher = true,
    })

    vim.cmd("colorscheme witch-dark")
  end,
}
