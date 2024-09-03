-- set leader and some "global" stuff`
vim.g.mapleader = ","

-- Maps
local keymap = vim.keymap
keymap.set("n", "<Space>", ":nohl<CR>", { desc = "Un-highlight (:nohl)" })

-- split stuff
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- global utilities
-- keymap.set("n", "dq", "<cmd>:Cfilter! <C-r><C-f><CR>", { desc = "Delete from quickfix list" })

-- temp stuff
keymap.set("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "keymap guide" })
