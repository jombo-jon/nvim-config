


--vim.g.gruvbox_material_background = "medium" -- hard, soft, medium
--vim.g.gruvbox_material_palette = "original" -- original, mix, material
--vim.g.gruvbox_material_enable_italic = 1
--vim.g.gruvbox_material_sign_column_background = 'none'
-- vim.cmd 'color gruvbox-material'
-- vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])

function GruvboxPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })

	vim.g.gruvbox_material_background = "medium" -- hard, soft, medium
	vim.g.gruvbox_material_palette = "original" -- original, mix, material
  vim.g.gruvbox_transparent_bg = 1
	vim.o.background = "dark" -- or "light" for light mode

  vim.cmd("set background=dark")
  vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
	

end

GruvboxPencils()
