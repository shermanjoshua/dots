return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local lspsaga = require("lspsaga")

    lspsaga.setup({
      lightbulb = {
        enable = true,
        sign = false,
        virtual_text = false,
      },
      definition = {
        keys = {
          edit = { "o", "<cr>" },
          vsplit = "v",
          split = "s",
          tabe = "t",
          quit = { "q", "<ESC>" },
        },
      },
      callhierarchy = {
        keys = {
          edit = { "o", "<cr>" },
          vsplit = "v",
          split = "s",
          tabe = "t",
          quit = { "q", "<ESC>" },
          shuttle = { "<c-l>", "<c-h>" },
          toggle_or_req = "u",
        },
      },
      diagnostic = {
        keys = {
          quit = { "q", "<ESC>" },
        },
      },
      finder = {
        keys = {
          shuttle = { "<c-o>", "<c-p>" },
          toggle_or_open = { "o", "<cr>" },
          vsplit = "s",
          split = "h",
          tabe = "t",
          tabnew = "r",
          quit = { "q", "<ESC>" },
        },
        methods = {
          typ = "textDocument/typeDefinition",
        },
      },
      outline = {
        keys = {
          toggle_or_jump = { "o", "<cr>" },
          quit = { "q", "<ESC>" },
          jump = "e",
        },
      },
      code_action = {
        keys = {
          quit = { "q", "<ESC>" },
          exec = "<cr>",
        },
      },
      keys = {
        -- Call hierarchy
        { "<Leader>li", "<cmd>silent Lspsaga incoming_calls<CR>", mode = "n", silent = true, remap = false },
        { "<Leader>lo", "<cmd>silent Lspsaga outgoing_calls<CR>", mode = "n", silent = true, remap = false },

        -- Floating terminal
        { "<A-d>", "<cmd>silent Lspsaga term_toggle<CR>", mode = { "n", "t" }, silent = true, remap = false },
      },
    })
  end,
}
