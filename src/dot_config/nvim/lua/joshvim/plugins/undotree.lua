return {
  "mbbill/undotree",
  lazy = true,
  cmd = "UndotreeToggle",
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>U", ":UndotreeToggle", { desc = "undo tree" })
    function _G.undotree()
      vim.cmd("UndotreeToggle")
    end
  end,
}
