return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spelling = true,
    marks = true,
    spec = {
      { "<leader>a", group = "ai/copilot/gpt" },
      { "<leader>b", group = "buffers" },
      { "<leader>c", group = "code" },
      { "<leader>d", group = "debug" },
      { "<leader>e", group = "file tree" },
      { "<leader>f", group = "file/find" },
      { "<leader>g", group = "git" },
      { "<leader>m", group = "formatting" },
      { "<leader>p", group = "github" },
      { "<leader>s", group = "windows/ui" },
      { "<leader>t", group = "tests" },
      { "<leader>w", group = "sessions" },
      { "<leader>x", group = "diagnostics/quickfix" },
      { "<leader>z", group = "database" },
    },
    notify = true,
    plugins = {
      spelling = {
        enabled = false,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    show_help = false,
    disable = {
      ft = {},
      bt = {},
    },
  },
}
