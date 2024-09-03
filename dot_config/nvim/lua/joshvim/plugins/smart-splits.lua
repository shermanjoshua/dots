return {
  "mrjones2014/smart-splits.nvim",
  build = "./kitty/install-kittens.bash",
  event = "VeryLazy",
  config = function()
    local smart_splits = require("smart-splits")

    local keymap = vim.keymap

    -- recommended mappings
    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
    keymap.set("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize pane left" })
    keymap.set("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize pane down" })
    keymap.set("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize pane up" })
    keymap.set("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize pane right" })
    -- moving between splits
    keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move pane left" })
    keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move pane down" })
    keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move pane up" })
    keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move pane right" })
    -- swapping buffers between windows
    keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left, { desc = "Swap buffer left" })
    keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down, { desc = "Swap buffer down" })
    keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up, { desc = "Swap buffer up" })
    keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right, { desc = "Swap buffer right" })

    smart_splits.setup()
  end,
}
