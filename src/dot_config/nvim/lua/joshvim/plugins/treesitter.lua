-- TODO: check on this: https://github.com/loctvl842/nvim/blob/master/lua/beastvim/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      autotag = {
        enable = true,
      },
      highlight = { enable = true },
      indent = { enable = true, disable = { "yaml", "html" } },
      ensure_installed = {
        "ruby",
        "yaml",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "regex",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
