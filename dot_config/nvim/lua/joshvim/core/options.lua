vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- whereami stuff
opt.relativenumber = true
opt.number = true
opt.cursorline = true

-- whitespace stuff
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search stuff
opt.ignorecase = true
opt.smartcase = true

-- visual stuff
opt.wrap = false
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- keyboard stuff
opt.backspace = "indent,eol,start"

-- window stuff
opt.splitright = true
opt.splitbelow = true

-- system stuff
opt.swapfile = false
opt.clipboard:append("unnamedplus")
opt.conceallevel = 1 -- added just for obsidian
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
