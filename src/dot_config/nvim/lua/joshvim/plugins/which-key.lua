return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 1000
  end,
  opts = {
    spelling = true,
    marks = true,
  },
  preset = {
    z = true,
    g = true,
  },
  icons = {
    separator = "",
    group = "",
  },
  defaults = {
    mode = { "n", "v" },
    ["g"] = { name = "+goto" },
    -- this was a copy paste and doesn't do anything
    -- and there is the surround plugin installed so
    -- maybet that can get annotated here
    -- ["gs"] = { name = "+surround" },
    -- ["z"] = { name = "+fold" },
    ["]"] = { name = "+next" },
    ["["] = { name = "+prev" },
    ["<leader>a"] = { name = " copilot/gpt" },
    ["<leader>b"] = { name = " buffers" },
    ["<leader>c"] = { name = "󰨞 code" },
    ["<leader>d"] = { name = "󱁤 debug" },
    ["<leader>e"] = { name = "󱏒 file tree" },
    ["<leader>f"] = { name = " file/find" },
    ["<leader>g"] = { name = "󰘭 git" },
    ["<leader>m"] = { name = "󰃢 formatting" },
    -- ["<leader>i"] = { name = "󰛢 Grapple" },
    -- ["<leader>j"] = { name = " Flash" },
    -- ["<leader>m"] = { name = "󱃲 Visul Multi" },
    -- ["<leader>n"] = { name = " Neorg" },
    -- ["<leader>p"] = { name = " Packages" },
    -- ["<leader>s"] = { name = "󰦅 Search" },
    -- ["<leader>u"] = { name = "󰨇 Ui/Ux" },
    ["<leader>t"] = { name = "󰸨 tests" },
    ["<leader>w"] = { name = "󰸨 sessions" },
    ["<leader>x"] = { name = "󱁤 diagnostics/quickfix" },
    -- ["<leader>t"] = { name = " Terminal" },
    -- ["<leader>k"] = { name = "󰺿 Telekasten" },
    ["<leader>z"] = { name = " database" },
  },
}
