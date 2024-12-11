local set = vim.keymap.set

vim.global.mapleader = " "

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set({ "v", "n" }, "<leader>y", "\"+y")
