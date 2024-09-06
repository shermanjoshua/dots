return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  event = {
    "BufReadPre /Users/joshsherman/Documents/obsidian/**/*.md",
    "BufNewFile /Users/joshsherman/Documents/obsidian/**/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "joshVault",
        path = "~/Documents/obsidian/joshVault",
      },
      {
        name = "textus",
        path = "~/Documents/obsidian/textus",
      },
    },

    -- Notes
    notes_subdir = "notes",
    daily_notes = "notes/dailyNotes",
    new_notes_location = "notes_subdir",

    -- Editor Shit
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Keymaps
    mappings = {
      -- Functions (for custom shit)
      -- THIS MIGHT NOT WORK!!! IF gf is broke, check here:
      -- https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file#gf-passthrough
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>x"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },

      -- Normal Maps
    },

    preferred_link_style = "wiki",

    -- Template Shit
    templates = {
      folder = "templates",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },

    -- Open External Links In Browser
    -- @param url string
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url }) -- Mac OS
      vim.ui.open(url) -- need Neovim 0.10.0+
    end,

    -- Open Image (from nvim)
    -- @param img string
    follow_img_func = function(img)
      vim.fn.jobstart({ "qlmanage", "-p", img })
    end,

    -- TODO
    -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = false,

    -- Don't come to the front!!!
    open_app_foreground = false,

    picker = {
      name = "telescope.nvim",
      note_mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
      tag_mappings = {
        tag_note = "<C-x>",
        insert_tag = "<C-l>",
      },
    },
    -- `sort_by` values are: "path", "modified", "accessed", or "created".
    sort_by = "modified",
    sort_reversed = true,

    search_max_lines = 1000,

    -- Values are: "current", "vsplit", or "hsplit"
    open_notes_in = "current",

    -- For more customization...
    callbacks = {
      -- @param client obsidian.Client
      post_setup = function(client) end,

      -- @param client obsidian.Client
      -- @param note obsidian.Note
      enter_note = function(client, note) end,

      -- @param client obsidian.Client
      -- @param note obsidian.Note
      leave_note = function(client, note) end,

      -- @param client obsidian.Client
      -- @param note obsidian.Note
      pre_write_note = function(client, note) end,

      -- @param client obsidian.Client
      -- @param workspace obsidian.Workspace
      post_set_workspace = function(client, workspace) end,
    },

    -- Vim setting `conceallevel` must be set to 1 or 2. Set in options.lua
    ui = {
      enable = true,
      update_debounce = 200,
      max_file_length = 5000,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

    attachments = {
      img_folder = "attachments",

      -- @return string
      img_name_func = function()
        return string.format("%s-", os.time())
      end,

      -- @param client obsidian.Client
      -- @param path obsidian.Path the absolute path to the image file
      -- @return string
      img_text_func = function(client, path)
        path = client:vault_relative_path(path) or path
        return string.format("![%s](%s)", path.name, path)
      end,
    },
  },
}