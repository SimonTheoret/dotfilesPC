-- Color Scheme and opacity:
function Color(color)
	color = color or "monokkai"
	vim.cmd.colorscheme('monokai')
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Color()