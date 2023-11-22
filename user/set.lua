
vim.g.mapleader =","

vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

-- Highlight while searching
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.cursorline = true

-- Keymaps
vim.keymap.set("n","<leader>e",vim.cmd.Ex)
vim.keymap.set("n","<leader>w",":w<CR>")
vim.keymap.set("n","<leader>q",":q<CR>")

vim.keymap.set("i","jj","<ESC>")

-- Naviguation in split
vim.keymap.set("n","<C-h>","<C-W>h")
vim.keymap.set("n","<C-j>","<C-W>j")
vim.keymap.set("n","<C-k>","<C-W>k")
vim.keymap.set("n","<C-l>","<C-W>l")

-- Naviguation Page Up/Down
vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")

-- Greatest Copy/Paste
vim.keymap.set("n","<leader>y","\"+y")
vim.keymap.set("v","<leader>y","\"+y")
vim.keymap.set("n","<leader>Y","\"+Y")

-- Change on Word!
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Move when in visual
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")

-- Explorer
vim.keymap.set("n","<leader>se" ,":Sexplore<CR>") -- Horizontal Explo
vim.keymap.set("n","<leader>ve" ,":Vexplore<CR>") -- Vertical Explo


