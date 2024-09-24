return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "folke/neodev.nvim",
  },
  config = function()
    local dapui = require("dapui")
    local neodev = require("neodev")

    dapui.setup({
      icons = {
        expanded = "▾",
        collapsed = "▸",
        current_frame = "*",
      },
      controls = {
        element = "",
        enabled = true,
        toolbar = false,
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
      },
      element_mappings = {},
      expand_lines = vim.fn.has("nvim-0.7") == 1,
      force_buffers = true,
      layouts = {},
      floating = {
        border = "single",
        mappings = {
          close = "q",
        },
      },
      render = {
        indent = 2,
      },
    })

    neodev.setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })

    local dap = require("dap")
    local keymap = require("vim.keymap")

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_initialized.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    keymap.set("n", "<leader>du", "<cmd>lua dapui.toggle()<cr>", { desc = "Toggle dap-ui" })
  end,
}
