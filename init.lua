print("Hello World")

-- General ----------------------------------------
-- Relative Line Number
vim.opt.relativenumber = true
vim.opt.nu = true

-- How to show characters
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- No bell noise
vim.opt.errorbells = false

-- Tabulation Setup
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.showtabline = 4
vim.opt.swapfile = false
vim.opt.termguicolors = true

-- Leader Key
vim.g.mapleader =","

-- Keymap ----------------------------------------
vim.keymap.set('n',"<leader>e" ,":Explore<CR>")
--nnoremap("<leader>e" ,":Explore<CR>")
--nnoremap("<leader>se" ,":Sexplore<CR>")
--nnoremap("<leader>ve" ,":Vexplore<CR>")
--
--nnoremap("<leader>tn",":tabnew<CR>")
--nnoremap("<leader>te",":tabedit %<CR>")
--
---- Save and quit
--nnoremap("<leader>w",":w<CR>")
--nnoremap("<leader>q",":q<CR>")
--nnoremap("<leader>sw",":w !sudo tee%<CR>")
--nnoremap("<leader>so",":so %<CR>")
--
---- Ctrl A in normal
---- nnoremap("<C-a>","ggVG")
--
---- Esc with jj
--inoremap("jj","<Esc>")
