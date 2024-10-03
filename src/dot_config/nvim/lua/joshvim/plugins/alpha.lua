---class: alpha
local C = {}

---return: table
C = {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                               __       ]],
      [[                              |  \      ]],
      [[       __  ______      _______| ▓▓____  ]],
      [[      |  \/      \    /       \ ▓▓    \ ]],
      [[       \▓▓  ▓▓▓▓▓▓\  |  ▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓\]],
      [[      |  \ ▓▓  | ▓▓   \▓▓    \| ▓▓  | ▓▓]],
      [[      | ▓▓ ▓▓__/ ▓▓__ _\▓▓▓▓▓▓\ ▓▓  | ▓▓]],
      [[      | ▓▓\▓▓    ▓▓  \       ▓▓ ▓▓  | ▓▓]],
      [[ __   | ▓▓ \▓▓▓▓▓▓ \▓▓\▓▓▓▓▓▓▓ \▓▓   \▓▓]],
      [[|  \__/ ▓▓                              ]],
      [[ \▓▓    ▓▓                              ]],
      [[  \▓▓▓▓▓▓                               ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("<Tab>", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button(", ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button(", fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button(", wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

return C
