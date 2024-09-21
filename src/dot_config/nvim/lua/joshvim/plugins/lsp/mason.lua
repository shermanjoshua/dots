return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list language servers here
      ensure_installed = {
        "solargraph",
        "html",
        "cssls",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "dockerls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      -- list linters here
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "black",
        "pylint",
        "eslint_d",
        "terraform-ls",
        "yamlls",
      },
    })
  end,
}
