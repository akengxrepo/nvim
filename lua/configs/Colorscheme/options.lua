local M = {}

function M.options()
	local options = {
		terminal_colors = false,
		dim_inactive = true,
		modules = {
			cmp = true,
			diagnostic = true,
			lsp_trouble = true,
			gitsigns = true,
			modes = true,
			native_lsp = true,
			nvimtree = true,
			telescope = true,
			treesitter = true,
			whichkey = true,
		},
	}
end

return M
