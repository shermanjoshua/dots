-- return {
--   vim.notify("Loading dap.lua", vim.log.levels.INFO),
--   "mfussenegger/nvim-dap",
--   dependencies = {
--     "mxsdev/nvim-dap-vscode-js",
--     dependencies = {
--       "microsoft/vscode-js-debug",
--       version = "1.x",
--       build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
--     },
--     config = function()
--       local dap_vscode_js = require("nvim-dap-vscode-js")
--       local say = require("vim.notify")
--
--       dap_vscode_js.setup({
--         debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
--         adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
--         say("DEBUG PATH: ${debugger_path}", vim.log.levels.INFO),
--         -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--         -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--         -- log_file_level = 0, -- Logging level for output to file. Set to false to disable file logging.
--         -- log_file_path = "",
--         -- log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
--       })
--     end,
--   },
--   vim.notify("GOING INTO CONFIG FUNCTION", vim.log.levels.INFO),
--   config = function()
--     local dap = require("nvim-dap")
--     local js_langs = { "javascript", "typescript" }
--
--     for _, language in ipairs(js_langs) do
--       dap.configurations[language] = {
--         {
--           type = "pwa-node",
--           request = "launch",
--           name = "Launch file",
--           program = "${file}",
--           cwd = "${workspaceFolder}",
--         },
--         {
--           type = "pwa-node",
--           request = "attach",
--           name = "Attach",
--           processId = require("dap.utils").pick_process,
--           cwd = "${workspaceFolder}",
--         },
--         {
--           type = "pwa-chrome",
--           request = "launch",
--           name = 'Start Chrome with "localhost"',
--           url = "http://localhost:3000",
--           webRoot = "${workspaceFolder}",
--           userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
--         },
--       }
--     end
--     local map = require("vim.keymap")
--
--     map.set("n", "<F5>", dap.continue, { desc = "debug: Start/Continue" })
--     -- map.set("n", "<F7>", dapui.toggle, { desc = "debug: See last session result (use for Unhandled)" })
--     map.set("n", "<F10>", dap.step_over, { desc = "debug: Step Over" })
--     map.set("n", "<F11>", dap.step_into, { desc = "debug: Step Into" })
--     map.set("n", "<F12>", dap.step_out, { desc = "debug: Step Out" })
--     map.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "debug: Toggle Breakpoint" })
--     map.set("n", "<leader>Db", function()
--       dap.set_breakpoint(vim.fn.input("Enter breakpoint condition: "))
--     end, { desc = "debug: Set Breakpoint" })
--     map.set("n", "<leader>dl", dap.load_launch_json, { noremap = true, desc = "debug: Load launch.json" })
--     map.set("n", "<leader>dd", dap.disconnect, { noremap = true, desc = "debug: Disconnect" })
--     map.set("n", "<leader>dq", dap.stop, { noremap = true, silent = true, desc = "debug: Stop" })
--     map.set("n", "<leader>dr", "<Cmd>DapToggleRepl<CR>", { noremap = true, silent = true, desc = "debug: Toggle REPL" })
--     map.set("n", "<leader>dR", dap.run_last, { noremap = true, silent = true, desc = "debug: Run Previous Test" })
--   end,
--   vim.notify("FINISHED LOADING!!!", vim.log.levels.INFO),
--
-- }

-- local dapui = require("dapui")

-- Automatically open the UI when a new debug session is created.
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open({})
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close({})
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close({})
-- end

-- Use overseer for running preLaunchTask and postDebugTask.
-- require("overseer").patch_dap(true)
-- require("dap.ext.vscode").json_decode = require("overseer.json").decode

-- Lua configurations.
-- dap.adapters.nlua = function(callback, config)
--   callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
-- end
-- dap.configurations["lua"] = {
--   {
--     type = "nlua",
--     request = "attach",
--     name = "Attach to running Neovim instance",
--   },
-- }

-- C configurations.
-- dap.adapters.codelldb = {
--   type = "server",
--   host = "localhost",
--   port = "${port}",
--   executable = {
--     command = "codelldb",
--     args = { "--port", "${port}" },
--   },
-- }

-- Add configurations from launch.json
-- require("dap.ext.vscode").load_launchjs(nil, {
--   ["codelldb"] = { "c" },
--   ["pwa-node"] = { "typescript", "javascript" },
-- })

return {
  "rcarriga/nvim-dap-ui",
  lazy = true,
  event = "BufRead",
  dependencies = {
    { "mfussenegger/nvim-dap", lazy = true },
    { "nvim-neotest/nvim-nio", lazy = true },
    {
      "mxsdev/nvim-dap-vscode-js",
      dependencies = {
        "microsoft/vscode-js-debug",
        version = "1.x",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
      },
      config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("dap-vscode-js").setup({
          debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
          adapters = {
            "pwa-node",
            "pwa-chrome",
            "pwa-msedge",
            "node-terminal",
            "pwa-extensionHost",
          },
        })
      end,
    },
  },
  config = function()
    local js_based_languages = { "typescript", "javascript", "typescriptreact" }

    for _, language in ipairs(js_based_languages) do
      require("dap").configurations[language] = {
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = 'Start Chrome with "localhost"',
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
        },
      }
    end
  end,
  keys = {
    { "<leader>d", "", desc = "  Debug" },
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
    { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
    { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
    { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
    { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },
  },
}
