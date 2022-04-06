local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local colors = {
	bg = "#181a23",
	fg = "#bbc2cf",
	yellow = "#F2FA5A",
	grey = "#393E46",
	lightgrey = "#DDDDDD",
	white = "#FFFFFF",
	cyan = "#1FFFFF",
	green = "#49FF00",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#516BEB",
	darkblue = "#081633",
	red = "#F92727",
}

local config = {
	options = {
		numbers = "none", -- | "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator_icon = "▎", -- "▐", "▎"
		buffer_close_icon = " ", -- '' ""
		modified_icon = "●", -- "●", " "
		close_icon = " ",
		left_trunc_marker = " ",
		right_trunc_marker = " ",
		max_name_length = 31,
		max_prefix_length = 31,
		tab_size = 31,
		diagnostics = false, -- | false | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
		-- 	local icon = level:match("error") and " " or " "
		-- 	return " " .. icon .. count
		-- end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center",
				padding = 1,
			},
		},
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin", -- | "slant" | "padded_slant" | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = false,
		always_show_bufferline = true,
	},
	highlights = {
		fill = {
			-- guifg = "none",
			guifg = colors.fg,
			guibg = colors.bg,
		},
		background = {
			guifg = colors.fg,
			guibg = "none",
		},

		-- Close Button
		close_button = {
			guifg = "none",
			guibg = "none",
		},
		close_button_selected = {
			guifg = "none",
			guibg = "none",
		},
		close_button_visible = {
			guifg = "none",
			guibg = "none",
		},

		-- Tabs
		tab = {
			guifg = colors.fg,
			guibg = "none",
		},
		tab_selected = {
			guifg = colors.lightgrey,
			guibg = colors.darkblue,
			gui = "bold",
		},
		tab_close = {
			guifg = "none",
			guibg = "none",
		},

		-- Buffers
		buffer_selected = {
			guifg = colors.lightgrey,
			guibg = colors.darkblue,
			gui = "bold",
		},
		buffer_visible = {
			guifg = colors.fg,
			guibg = "none",
		},

		-- Modified
		modified = {
			guifg = colors.fg,
			guibg = "none",
		},
		modified_selected = {
			guifg = colors.yellow,
			guibg = colors.darkblue,
		},
		modified_visible = {
			guifg = colors.fg,
			guibg = "none",
		},

		-- Separator
		separator = {
			guifg = colors.lightgrey,
			guibg = "none",
		},
		separator_selected = {
			guifg = colors.lightgrey,
			guibg = "none",
		},
		separator_visible = {
			guifg = colors.lightgrey,
			guibg = "none",
		},

		-- Indicator
		indicator_selected = {
			guifg = colors.cyan,
			guibg = "none",
		},

		-- Pick
		pick = {
			guifg = "#D82148",
			guibg = "#082032",
			gui = "italic",
		},
		pick_selected = {
			guifg = "#49FF00",
			guibg = "none",
			gui = "bold",
		},
		pick_visible = {
			guifg = "#49FF00",
			guibg = "#082032",
			gui = "italic",
		},
	},
}

bufferline.setup(config)
