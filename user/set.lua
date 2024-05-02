
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


vim.opt.list = true
vim.opt.listchars = { space = '⋅', eol = '⤶', }

-- Keymaps
vim.keymap.set("n","<leader>e",vim.cmd.Ex)
vim.keymap.set("n","<leader>w",":w<CR>")
vim.keymap.set("n","<leader>q",":q<CR>")
vim.keymap.set("n","<leader>sw",":w !sudo tee%<CR>")
vim.keymap.set("n","<leader>so",":so %<CR>")

vim.keymap.set("i","jj","<ESC>")

-- Naviguation in split
vim.keymap.set("n","<C-h>","<C-W>h")
vim.keymap.set("n","<C-j>","<C-W>j")
vim.keymap.set("n","<C-k>","<C-W>k")
vim.keymap.set("n","<C-l>","<C-W>l")

-- Move Window to Left,Right,Top,Bottom with Ctrl+Shift+
-- vim.keymap.set("n","<c-J>","<C-W>J")
-- vim.keymap.set("n","<c-K>","<C-W>k")
-- vim.keymap.set("n","<c-H>","<C-W>H")
-- vim.keymap.set("n","<c-L>","<C-W>L")

-- Naviguation Page Up/Down
vim.keymap.set("n","<C-i>","<C-u>zz")
vim.keymap.set("n","<C-,>","<C-d>zz")

-- Resize windows
vim.keymap.set("n","<C-left>",":veritcal resize +5<CR>"); 
vim.keymap.set("n","<C-right>",":veritcal resize -5<CR>"); 
vim.keymap.set("n","<C-down>",":resize -5<CR>"); 
vim.keymap.set("n","<C-up>",":resize +5<CR>"); 

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
vim.keymap.set("n","<leader>se" ,":Sexplore<CR>") -- Horizontal Explo Upper (Default)

vim.keymap.set("n","<leader>ve" ,":Vexplore<CR>") -- Vertical Explo on the Left (Default)
vim.keymap.set("n","<leader>le" ,":Vexplore<CR>") -- Vertical Explo on the Left
vim.keymap.set("n","<leader>re" ,":Vexplore!<CR>") -- Vertical Explo on the Right
vim.keymap.set("n","<leader>te" ,":Texplore<CR>") -- Tabulation Explo 

-- Define the function to set tab settings
function setTabTo2()
    vim.api.nvim_set_option('tabstop', 2)
    vim.api.nvim_set_option('softtabstop', 2)
    vim.api.nvim_set_option('shiftwidth', 2)
    vim.api.nvim_set_option('expandtab', true)
end

function setTabTo4()
    vim.api.nvim_set_option('tabstop', 4)
    vim.api.nvim_set_option('softtabstop', 4)
    vim.api.nvim_set_option('shiftwidth', 4)
    vim.api.nvim_set_option('expandtab', true)
end

-- Create a custom command
vim.cmd("command! SetTab2 lua setTabTo2()")
vim.cmd("command! SetTab4 lua setTabTo4()")
