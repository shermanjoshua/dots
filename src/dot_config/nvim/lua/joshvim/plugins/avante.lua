return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {},
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  config = function()
    local avante = require("avante")
    local avante_lib = require("avante_lib").load()
    require("img-clip").setup({})
    require("copilot").setup({})
    require("render-markdown").setup({})

    avante.setup({
      provider = "openai",
      auto_suggestions_provider = "openai",
      keymaps = {
        toggle_auto_suggestions = "<leader>as",
        accept_suggestion = "<leader>aa",
        next_suggestion = "<leader>an",
        previous_suggestion = "<leader>ap",
      },
      openai = {
        model = "gpt-4o",
        temperature = 0.7,
        max_tokens = 1000,
      },
    })
  end,
}
