local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "joshvim.plugins" },
  { import = "joshvim.plugins.lsp" },
  { import = "joshvim.utils" },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
})
