return {
  "mfussenegger/nvim-dap",
  event = "BufRead",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "suketa/nvim-dap-ruby",
  },
  config = function()
    local dap = require("dap")
    local virtual_text = require("nvim-dap-virtual-text")
    local dap_ruby = require("dap-ruby")
    local mason = require("mason")

    local mason_dap = require("mason-nvim-dap")
    mason.setup()
    mason_dap.setup({
      ensure_installed = {
        "delve",
      },
      automatic_installation = true,
      automatic_setup = true,
      handlers = {},
    })

    dap.adapters.ruby = function(callback, config)
      callback({
        type = "server",
        host = "127.0.0.1",
        port = "${port}",
        executable = {
          command = "rdbg",
          args = {
            "--open",
            "--port",
            tostring("${port}"),
            "-c",
            "--",
            "ruby",
            "${file}",
          },
        },
      })

      dap.configurations.ruby = {
        {
          name = "debug rails",
          type = "ruby",
          -- request = "launch",
          request = "attach",
          -- command = "rails",
          pid = require("dap.utils").pick_process,
          args = {},
          -- script = "exec rails s",
          -- script = "server",
          -- port = 38697,
          -- server = "puma",
          -- options = {
          --   source_filetype = "ruby",
          -- },
          -- localfs = true,
          -- waiting = 1000,
        },
      }

      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = {
          vim.fn.glob(mason.get_install_path() .. "/packages/node-debug2-adapter/out/src/nodeDebug.js"),
        },
      }

      dap.configurations.javascript = {
        {
          name = "Launch Program",
          type = "node2",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
        },
        {
          name = "Attach to Process",
          type = "node2",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }

      dap.configurations.typescript = dap.configurations.javascript

      dap.adapters.bashdb = {
        type = "executable",
        command = mason.get_install_path() .. "/packages/bash-debug-adapter/bash-debug-adapter",
        name = "bashdb",
      }

      dap.configurations.sh = {
        {
          type = "bashdb",
          request = "launch",
          name = "Launch Bash script",
          showDebugOutput = true,
          pathBashdb = mason.get_install_path() .. "/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
          pathBashdbLib = mason.get_install_path() .. "/packages/bash-debug-adapter/extension/bashdb_dir",
          trace = true,
          file = "${file}",
          program = "${file}",
          cwd = "${workspaceFolder}",
          pathCat = "cat",
          pathBash = "/bin/bash",
          pathMkfifo = "mkfifo",
          pathPkill = "pkill",
          args = {},
          env = {},
          terminalKind = "integrated",
        },
      }
    end

    virtual_text.setup({})
    dap_ruby.setup()

    local keymap = require("vim.keymap")

    vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
    keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { noremap = true })
    keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", { noremap = true })
    keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", { noremap = true })
    keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", { noremap = true })
    keymap.set("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { noremap = true })
    keymap.set(
      "n",
      "<Leader>Db",
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      { noremap = true }
    )
    keymap.set(
      "n",
      "<Leader>dp",
      "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
      { noremap = true }
    )
    keymap.set("n", "<Leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", { noremap = true })
    keymap.set("n", "<Leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { noremap = true })
  end,
}
