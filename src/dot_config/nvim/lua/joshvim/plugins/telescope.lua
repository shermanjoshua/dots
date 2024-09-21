return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-dap.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
            ["<C-s>"] = actions.select_vertical,
            ["<C-h>"] = actions.select_horizontal,
          },
          n = {
            ["s"] = actions.select_vertical,
            ["h"] = actions.select_horizontal,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("noice")
    telescope.load_extension("chezmoi")
    telescope.load_extension("dap")

    local keymap = vim.keymap
    local builtin = telescope.builtin

    -- Find Stuff
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fc", telescope.extensions.chezmoi.find_files, { desc = "Find dotfiles (chezmoi)" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find Todos" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string (Grep)" })

    -- Git Stuff
    keymap.set("n", "<leader>gs", builtin.git_status, { desc = "git status" })
    keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "git branch -a" })
    keymap.set("n", "<leader>gf", builtin.git_files, { desc = "git files(?)" })

    -- nvim Stuff
    keymap.set("n", "<leader>b", builtin.buffers, { desc = "Show buffers" })
    keymap.set("n", "<leader>fq", function()
      actions.smart_send_to_qflist()
    end, { desc = "Send to Quickfix" })
  end,
}
