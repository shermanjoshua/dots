return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mxsdev/nvim-dap-vscode-js",
      "microsoft/vscode-js-debug",
      "suketa/nvim-dap-ruby",
    },
    config = function()
      local dap = require("dap")
      -- local dap_ruby = require("dap-ruby")
      local dap_vscode_js = require("nvim-dap-vscode-js")

      local map = require("vim.keymap")

      map.set("n", "<F5>", dap.continue, { desc = "debug: Start/Continue" })
      -- map.set("n", "<F7>", dapui.toggle, { desc = "debug: See last session result (use for Unhandled)" })
      map.set("n", "<F10>", dap.step_over, { desc = "debug: Step Over" })
      map.set("n", "<F11>", dap.step_into, { desc = "debug: Step Into" })
      map.set("n", "<F12>", dap.step_out, { desc = "debug: Step Out" })
      map.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "debug: Toggle Breakpoint" })
      map.set("n", "<leader>Db", function()
        dap.set_breakpoint(vim.fn.input("Enter breakpoint condition: "))
      end, { desc = "debug: Set Breakpoint" })
      map.set("n", "<leader>dl", dap.load_launch_json, { noremap = true, desc = "debug: Load launch.json" })
      map.set("n", "<leader>dd", dap.disconnect, { noremap = true, desc = "debug: Disconnect" })
      map.set("n", "<leader>dq", dap.stop, { noremap = true, silent = true, desc = "debug: Stop" })
      map.set(
        "n",
        "<leader>dr",
        "<Cmd>DapToggleRepl<CR>",
        { noremap = true, silent = true, desc = "debug: Toggle REPL" }
      )
      map.set("n", "<leader>dR", dap.run_last, { noremap = true, silent = true, desc = "debug: Run Previous Test" })

      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

      -- dap.adapters.ruby = function(callback)
      --   callback({
      --     type = "ruby",
      --     host = "127.0.0.1",
      --     port = "${port}",
      --     executable = {
      --       command = "rdbg",
      --       args = {
      --         "--open",
      --         "--port",
      --         tostring("${port}"),
      --         "-c",
      --         "--",
      --         "ruby",
      --         "${file}",
      --       },
      --     },
      --   })
      -- end
      --
      -- dap.configurations.ruby = {
      --   name = "debug rails",
      --   type = "ruby",
      --   request = "attach",
      --   pid = require("dap.utils").pick_process,
      --   args = {},
      --   -- sourceMaps = true,
      --   -- port = 38697,
      -- }

      dap_vscode_js.setup({
        debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      })

      for _, language in ipairs({ "javascript", "typescript" }) do
        dap.configurations[language] = {
          {
            name = "Attach to Process - dotfiles",
            type = "pwa-node",
            request = "attach",
            processId = require("dap.utils").pick_process,
            sourceMaps = true,
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
            skipFiles = {
              "<node_internals>/**",
              "${workspaceFolder}/node_modules/**/*.js",
            },
          },
          {
            name = "debug (web) - Chrome",
            type = "pwa-chrome",
            request = "launch",
            url = "http://127.0.0.1:5173",
            sourceMaps = true,
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
            webRoot = "${workspaceFolder}/src",
            protocol = "inspector",
            port = 9222,
            skipFiles = { "**/node_modules/**/*", "**/src/client/*", "**/src/*" },
          },
        }
      end
    end,
  },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = {
  --     {
  --       "nvim-neotest/nvim-nio",
  --       {
  --         "mfussenegger/nvim-dap",
  --         opts = {},
  --       },
  --       {
  --         "theHamsta/nvim-dap-virtual-text",
  --         opts = {},
  --       },
  --     },
  --   },
  -- },
  -- configure = function()
  --   local dap = require("dap")
  --   local dapui = require("dapui")
  --
  --   dapui.setup({
  --     force_buffers = true,
  --     icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  --     -- default mappings
  --     mappings = {
  --       expand = { "<CR>", "<2-LeftMouse>" },
  --       open = "o",
  --       remove = "d",
  --       edit = "e",
  --       repl = "r",
  --       toggle = "t",
  --     },
  --     -- override mappings in here
  --     element_mappings = {},
  --     expand_lines = true,
  --     layouts = {
  --       {
  --         elements = {
  --           { id = "scopes", size = 0.25 },
  --           "breakpoints",
  --           "stacks",
  --           "watches",
  --         },
  --         size = 40,
  --         position = "left",
  --       },
  --       {
  --         elements = {
  --           "repl",
  --           "console",
  --         },
  --         size = 0.25,
  --         position = "bottom",
  --       },
  --     },
  --     controls = {
  --       enabled = true,
  --       element = "repl",
  --       icons = {
  --         disconnect = "",
  --         pause = "",
  --         play = "",
  --         run_last = "",
  --         step_back = "",
  --         step_into = "",
  --         step_out = "",
  --         step_over = "",
  --         terminate = "",
  --       },
  --     },
  --     floating = {
  --       max_height = 0.75, -- These can be integers or a float between 0 and 1.
  --       max_width = 0.75, -- Floats will be treated as percentage of your screen.
  --       border = "rounded", -- Border style. Can be "single", "double" or "rounded"
  --       mappings = {
  --         close = { "q", "<Esc>" },
  --       },
  --     },
  --     windows = { indent = 1 },
  --     render = {
  --       indent = 1,
  --       max_type_length = nil,
  --       max_value_lines = 100,
  --     },
  --   })
  --
  --   local virtual_text = require("nvim-dap-virtual-text")
  --   virtual_text.setup({ enabled = true })
  --
  --   dap.listeners.after.event_initialized["dapui_config"] = dapui.open
  --   dap.listeners.before.event_terminated["dapui_config"] = dapui.close
  --   dap.listeners.before.event_exited["dapui_config"] = dapui.close
  -- end,
}
