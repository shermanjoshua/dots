return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.del("n", "s", opts(""))
      vim.keymap.del("n", "H", opts(""))
      vim.keymap.del("n", "<Tab>", opts(""))
      vim.keymap.del("n", "C", opts(""))
      vim.keymap.del("n", "p", opts(""))
    end

    nvimtree.setup({
      on_attach = my_on_attach,
      view = {
        width = 30,
        relativenumber = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    local keymap = vim.keymap
    local api = require("nvim-tree.api")

    local function pee()
      if api.tree.is_tree_buf() then
        api.node.navigate.parent()
      else
        vim.api.nvim_feedkeys("p", "n", false)
      end
    end

    keymap.set("n", "<Tab>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "R", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    keymap.set("n", "s", api.node.open.vertical, { desc = "Open in vertical split" })
    keymap.set("n", "H", api.node.open.horizontal, { desc = "Open in horizontal split" })
    keymap.set("n", "C", api.tree.change_root_to_node, { desc = "Change tree root to this node" })
    keymap.set("n", "<C-p>", api.node.navigate.parent, { desc = "Navigate to parent node" })
    keymap.set("n", "p", pee, { desc = "Navigate to parent node" })
  end,
}
