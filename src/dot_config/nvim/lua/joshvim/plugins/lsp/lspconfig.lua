return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    "williamboman/mason.nvim",
  },
  config = function()
    require("neodev").setup({})
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>Lspsaga finder def+ref+imp+typ<CR>", opts) -- show definition, references

        opts.desc = "Go to LSP definition"
        keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- goto declaration

        opts.desc = "Show LSP definitions and edit in preview"
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window

        opts.desc = "Goto LSP implementations"
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- goto implementation

        opts.desc = "Show LSP code actions"
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

        opts.desc = "Jump to previous diagnostic"
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer

        opts.desc = "Jump to next diagnostic"
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default function for any not named below
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["solargraph"] = function()
        lspconfig["solargraph"].setup({
          cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", "stdio" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
          capabilities = capabilities,
          settings = {
            solargraph = {
              autoformat = false,
              checkGemVersion = true,
              completion = true,
              definitions = true,
              folding = true,
              hover = true,
              references = true,
              rename = true,
              symbols = true,
              useBundler = true,
            },
          },
          filetypes = { "ruby", "rakefile", "rake" },
        })
      end,
      ["ts_ls"] = function()
        lspconfig["ts_ls"].setup({
          capabilities = capabilities,
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        })
      end,
      ["tailwindcss"] = function()
        lspconfig["tailwindcss"].setup({
          capabilities = capabilities,
          filetypes = { "css", "javascript", "javascriptreact", "typescriptreact" },
        })
      end,
      ["graphql"] = function()
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      ["yamlls"] = function()
        lspconfig["yamlls"].setup({
          capabilities = capabilities,
          filetypes = { "yaml", "yml", "yaml.tmpl", "yml.tmpl" },
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/circleciconfig.json"] = "/.circleci/config.yml",
              },
            },
          },
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          filetypes = { "lua" },
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  ["vim.env.VIMRUNTIME"] = true,
                  ["vim.env.VIMRUNTIME/lua/vim/lsp"] = true,
                  [vim.fn.expand("${3rd}/luv/library")] = true,
                },
                maxPreload = 10000,
                preloadFileSize = 10000,
              },
              runtime = {
                version = "LuaJIT",
              },
              hint = {
                enable = true,
              },
            },
          },
        })
      end,
    })
  end,
}
