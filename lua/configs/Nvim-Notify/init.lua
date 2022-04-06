local status_ok, notify = pcall(require, "notify")
if not status_ok then
	require("configs.utils").notify_missing("nvim-notify")
	return
end

local icons = require("generals.icons")

notify.setup({
	-- Default timeout for notifications
	timeout = 1000,
	-- Minimum width for notification windows
	minimum_width = 46,
	-- Max number of columns for messages
	max_width = 200,
	-- Max number of lines for messages
	max_height = 90,
	-- Animation style (see below for details)
	stages = "fade", -- ( fade, fade_in_slide_out, slide, static )
	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group or an RGB hex value e.g. "#000000"
	-- background_colour = "Normal",
	-- Icons for the different levels
	icons = {
		ERROR = icons.diagnostics.Error,
		WARN = icons.diagnostics.Warning,
		INFO = icons.diagnostics.Information,
		DEBUG = icons.ui.Bug,
		TRACE = icons.ui.Pencil,
	},
	-- Function called when a new window is opened, use for changing win settings/config
	on_open = nil,
	-- Function called when a window is closed
	on_close = nil,
	-- Render function for notifications. See notify-render()
	render = "default",
})

vim.notify = notify
