local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status_ok, icons = pcall(require, "generals.icons")
if not status_ok then
	return
end

local colors = {
	-- bg = "#1a212e",
	bg = "#082032",
	fg = "#bbc2cf",
	black = "#181a23",
	blue = "#516BEB",
	darkblue = "#081633",
	cyan = "#1FFFFF",
	green = "#49FF00",
	grey = "#383a42",
	lightgrey = "#DDDDDD",
	magenta = "#c678dd",
	orange = "#FF8800",
	red = "#F92727",
	violet = "#a9a1e1",
	white = "#FFFFFF",
	yellow = "#F2FA5A",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		disabled_filetypes = { "alpha", "NvimTree", "toggleterm" },
		section_separators = "",
		component_separators = "",
		theme = {
			normal = {
				b = { fg = colors.fg, bg = colors.darkblue },
				c = { fg = colors.fg, bg = colors.black },
				x = { fg = colors.fg, bg = colors.black },
				y = { fg = colors.fg, bg = colors.darkblue },
			},
			inactive = {
				b = { fg = colors.fg, bg = colors.darkblue },
				c = { fg = colors.fg, bg = colors.black },
				x = { fg = colors.fg, bg = colors.black },
				y = { fg = colors.fg, bg = colors.darkblue },
			},
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

local function inactive_sections_left(component)
	table.insert(config.inactive_sections.lualine_c, component)
end

local function inactive_sections_right(component)
	table.insert(config.inactive_sections.lualine_x, component)
end

local function color_mode()
	local mode_color = {
		n = colors.green,
		v = colors.cyan,
		[""] = colors.cyan,
		V = colors.cyan,
		R = colors.blue,
		["!"] = colors.red,
		i = colors.orange,
		l = colors.magenta,
		c = colors.blue,
		t = colors.red,
	}
	return { fg = colors.black, bg = mode_color[vim.fn.mode()], gui = "bold" }
end

local function color_bar()
	local bar_color = {
		n = colors.green,
		v = colors.cyan,
		[""] = colors.cyan,
		V = colors.cyan,
		R = colors.blue,
		["!"] = colors.red,
		i = colors.orange,
		l = colors.magenta,
		c = colors.blue,
		t = colors.red,
	}
	return { fg = bar_color[vim.fn.mode()] }
end

local function progress_bar()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	-- local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local chars = {
		"█",
		"▇",
		"▆",
		"▅",
		"▄",
		"▃",
		"▂",
		"▁",
		"_",
		"▁",
		"▂",
		"▃",
		"▄",
		"▅",
		"▆",
		"▇",
		"█",
	}
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local function lsp_client(msg)
	msg = msg or "Inactive"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.buf_get_clients()
	if next(clients) == nil then
		if type(msg) == "boolean" or #msg == 0 then
			return " Inactive"
		end
	end
	local buf_client_names = {}
	for _, client in pairs(clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end
	return " " .. table.concat(buf_client_names)
end

-- Inactive Status --
inactive_sections_left({
	function()
		return "█"
	end,
	color = color_bar,
	padding = { left = 0, right = 0 },
})

inactive_sections_right({
	function()
		return "█"
	end,
	color = color_bar,
	padding = { left = 0, right = 0 },
})

-- Left Status --
ins_left({
	function()
		return "█"
	end,
  -- progress_bar,
	color = color_bar,
	padding = { left = 0, right = 0 },
})

ins_left({
	function()
		return "% "
	end,
})

ins_left({
	"mode",
	color = color_mode,
	padding = { left = 1, right = 1 },
	separator = { left = "", right = "" },
})

ins_left({
	"diff",
	symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.yellow },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
	padding = { left = 2 },
})

-- Middle Status --
ins_right({
	"progress",
	icon = "%",
	color = { fg = colors.fg, bg = colors.black, gui = "bold" },
	padding = { right = 2 },
})

ins_right({
	"branch",
	icon = "",
	-- color = { fg = colors.green, bg = colors.black, gui = "bold" },
	color = color_bar,
	-- cond = conditions.hide_in_width,
	cond = nil,
	padding = { right = 1 },
})

ins_right({
	lsp_client,
	-- icon = "",
	color = { fg = colors.fg, bg = colors.black, gui = "bold" },
	padding = { left = 1 },
})

ins_right({
	function()
		return "%="
	end,
})

-- Right Status --
ins_right({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = {
		error = icons.diagnostics.Error .. " ",
		warn = icons.diagnostics.Warning .. " ",
		hint = icons.diagnostics.Hint .. " ",
	},
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
	update_in_insert = true,
	padding = { right = 2 },
})

ins_right({
	"%l/%L",
	color = color_mode,
	padding = { left = 1, right = 1 },
	separator = { left = "", right = "" },
})

ins_right({
	function()
		return "% "
	end,
})

ins_right({
	function()
		return "█"
	end,
  -- progress_bar,
	color = color_bar,
	padding = { left = 0, right = 0 },
})

lualine.setup(config)
