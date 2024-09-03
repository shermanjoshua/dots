return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions jump_type=never<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR> jump_type=never", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions jump_type=never<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- local capabilities = cmp_nvim_lsp.default_capabilities()
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default for any not named below
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      -- ["ruby_lsp"] = function()
      --   lspconfig["ruby_lsp"].setup({
      --     cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp" },
      --     root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
      --     capabilities = capabilities,
      --     settings = {
      --       ruby_lsp = {
      --         autoformat = true,
      --         formatting = true,
      --         completion = true,
      --         diagnostics = true,
      --         folding = true,
      --         references = true,
      --         rename = true,
      --         symbols = true,
      --       },
      --     },
      --     filetypes = { "ruby", "rakefile", "rake" },
      --   })
      -- end,
      ["solargraph"] = function()
        lspconfig["solargraph"].setup({
          cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", "stdio" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
          capabilities = capabilities,
          init_options = {
            formatting = false,
          },
          settings = {
            solargraph = {
              autoformat = false,
              checkGemVersion = true,
              completion = true,
              definitions = true,
              diagnostics = true,
              folding = true,
              formatting = false,
              hover = true,
              logLevel = "warn",
              references = true,
              rename = true,
              symbols = true,
              useBundler = true,
            },
          },
          filetypes = { "ruby", "rakefile", "rake" },
        })
      end,
      ["standardrb"] = function()
        lspconfig["standardrb"].setup({
          cmd = { os.getenv("HOME") .. "/.rbenv/shims/standardrb", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
          capabilities = capabilities,
          settings = {
            standardrb = {
              autoformat = true,
              formatting = true,
              completion = true,
              diagnostics = true,
              folding = true,
              references = true,
              rename = true,
              symbols = true,
            },
          },
          filetypes = { "ruby", "rakefile", "rake" },
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
