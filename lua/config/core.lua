require("config.color")

local opt = vim.opt
local g = vim.g

opt.showmode = true

opt.backspace = { "indent", "eol", "start" }
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.shiftround = true
opt.autoindent = true
opt.smartindent = true

opt.number = true
opt.relativenumber = false

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.backup = false

opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/tmp/undo")

opt.updatetime = 50

vim.b.fileencoding = "utf-8"

opt.wildmenu = true
opt.hlsearch = false
opt.completeopt = { "menu", "menuone" }
opt.cursorline = true
opt.signcolumn = "yes"
opt.autoread = true
opt.title = true
opt.mouse = "a"
opt.exrc = true
opt.wrap = true
opt.splitright = true
