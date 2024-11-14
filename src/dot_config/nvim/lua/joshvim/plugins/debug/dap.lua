return {
  "mfussenegger/nvim-dap",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    { "nvim-neotest/nvim-nio", lazy = true },
    {
      "suketa/nvim-dap-ruby",
      config = function()
        require("dap-ruby").setup()
      end,
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      dependencies = {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
      config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("dap-vscode-js").setup({
          debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
          adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
        })
      end,
    },
  },
  config = function()
    -- LANGUAGES --
    -- javascript-ish
    local js_languages = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
    local dap = require("dap")
    local dap_virtual_text = require("nvim-dap-virtual-text")

    for _, language in ipairs(js_languages) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "attach",
          name = "attach",
          processid = require("dap.utils").pick_process,
          cwd = "${workspacefolder}",
          sourcemaps = true,
          resolvesourcemaplocations = {
            "${workspacefolder}/**",
            "!**/node_modules/**",
          },
          -- uncommented
          skipfiles = {
            "<node_internals>/**",
            "${workspacefolder}/node_modules/**/*.js",
          },
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "launch file (node)",
          program = "${file}",
          cwd = "${workspacefolder}",
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = "start chrome with localhost",
          url = "http://localhost:5173",
          sourcemaps = true,
          protocol = "inspector",
          port = 9222,
          webroot = "${workspacefolder}/src",
          userdatadir = "${workspacefolder}/.vscode/vscode-chrome-debug-userdatadir",
          skipfiles = { "**/node_modules/**/*" },
        },
      }
    end

    -- ruby/rails

    -- local function start_ruby_debugger()
    --   vim.fn.setenv("RUBYOPT", "-rdebug/open")
    --   vim.notify("in the method", vim.log.levels.INFO)
    --   require("dap").continue()
    -- end

    -- local function start_rspec_debugger()
    --   local command = "rspec"
    --   if vim.fn.filereadable("bin/rspec") then
    --     command = "bin/rspec"
    --   end
    --   print("Using command: " .. command)
    --   -- https://github.com/ruby/debug?tab=readme-ov-file#invoke-as-a-remote-debuggee
    --   vim.fn.setenv("RUBYOPT", "-rdebug/open_nonstop")
    --   require("dap").run({
    --     type = "ruby",
    --     name = "debug current rspec file (from function)",
    --     request = "attach",
    --     command = command,
    --     script = "${file}",
    --     port = 38698, -- TODO: might be nice to make sure this port is open
    --     server = "127.0.0.1",
    --     localfs = true, -- required to be able to set breakpoints locally
    --     waiting = 100, -- HACK: This is a race condition with the set RUBYOPT, if you get ECONNREFUSED try changing RUBYOPT to -rdebug/open
    --   })
    -- end

    -- dap.adapters.ruby = function(callback, config)
    -- callback({
    --   type = "server",
    --   host = "127.0.0.1",
    --   port = 8086,
    --   executable = {
    --     command = "bundle",
    --     -- stylua: ignore
    --     args = {
    --       "exec", "rdbg", "-n", "--open", "--port", "${port}", "-c", "--", "bundle", "exec", "${command}", "${config.script}"
    --     },
    --   },
    -- })
    -- end

    dap.configurations.ruby = {
      {
        type = "ruby",
        name = "debug current file",
        port = 9222,
        request = "attach",
        localfs = true,
        command = "ruby",
      },
      {
        type = "ruby",
        name = "run current spec file",
        request = "attach",
        port = 9222,
        localfs = true,
        command = "rspec",
        script = "${file}",
      },
      {
        type = "ruby",
        request = "launch",
        name = "launch app",
        program = "bundle",
        programArgs = { "exec", "rails", "s" },
        useBundler = true,
      },
    }

    -- UI/UX --
    local dapui = require("dapui")
    dapui.setup({
      force_buffers = true,
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      -- default mappings
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      -- override mappings in here
      element_mappings = {},
      expand_lines = true,
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.25,
          position = "bottom",
        },
      },
      controls = {
        enabled = true,
        element = "repl",
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = "",
        },
      },
      floating = {
        max_height = 0.75,
        max_width = 0.75,
        border = "rounded",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        indent = 1,
        max_type_length = nil,
        max_value_lines = 100,
      },
    })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    dap_virtual_text.setup({ enabled = true })

    local map = require("vim.keymap")

    -- map.set("n", "<F5>", function()
    --   local filetype = vim.bo.filetype
    --   if filetype == "ruby" then
    --     start_ruby_debugger()
    --     vim.notify("Starting Ruby debugger F5", vim.log.levels.info)
    --   else
    --     require("dap").continue()
    --   end
    -- end, { desc = "debug: start/continue" })
    map.set("n", "<F5>", dap.continue, { desc = "debug: start/continue" })
    map.set("n", "<F7>", dapui.toggle, { desc = "debug: see last session result (use for unhandled)" })
    map.set("n", "<F10>", dap.step_over, { desc = "debug: step over" })
    map.set("n", "<F11>", dap.step_into, { desc = "debug: step into" })
    map.set("n", "<F12>", dap.step_out, { desc = "debug: step out" })
    map.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "debug: toggle breakpoint" })
    map.set("n", "<leader>dc", function()
      dap.set_breakpoint(vim.fn.input("enter breakpoint condition: "))
    end, { desc = "debug: set breakpoint" })
    map.set("n", "<leader>dx", dap.disconnect, { noremap = true, desc = "debug: disconnect" })
    map.set("n", "<leader>dq", dap.stop, { noremap = true, silent = true, desc = "debug: stop" })
    map.set("n", "<leader>dr", dap.repl.toggle, { noremap = true, silent = true, desc = "debug: toggle repl" })
    map.set("n", "<leader>dl", dap.run_last, { noremap = true, silent = true, desc = "debug: run previous test" })
    map.set("n", "<leader>dt", dap.terminate, { noremap = true, silent = true, desc = "debug: terminate" })

    vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })
  end,
  vim.notify("dap loaded", vim.log.levels.info),
}
