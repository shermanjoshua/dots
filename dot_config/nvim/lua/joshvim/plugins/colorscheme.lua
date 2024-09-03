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
          -- explorer = true,
          indentline = true,
        },
      },
      dim_inactive = {
        enabled = true,
        level = 0.48, -- Closer to 1 is lighter dimming
        excluded = {
          filetypes = {
            NvimTree = true,
            TelescopePrompt = true,
            TelescopeResults = true,
          },
          buftypes = {
            nofile = true,
            prompt = true,
            terminal = true,
          },
        },
      },
      switcher = true,
    })

    vim.cmd("colorscheme witch-dark")
  end,
}
