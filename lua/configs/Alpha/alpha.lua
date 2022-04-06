local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local plugins_opt = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/opt/", "*", 0, 1))
local plugins_start = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
local total_plugins = plugins_opt + plugins_start
local function footer()
	return "[ Neovim loaded "
		.. total_plugins
    .. " plugins   ]"
end

dashboard.section.header.val = {
  " v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	"   https://github.com/akengxgit ",
}

dashboard.section.buttons.val = {
	dashboard.button("1", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("2", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("3", "  Project", ":Telescope projects <CR>"),
	dashboard.button("4", "  Plugins", ":e ~/.config/nvim/lua/user/plugins.lua <CR>"),
	dashboard.button("5", "  History", ":Telescope oldfiles <CR>"),
	dashboard.button("6", "  Setting", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("7", "  Update plugins", ":PackerSync<CR>"),
	dashboard.button("x", "  Exit", ":qa<CR>"),
	-- dashboard.button("g", "  Grep", ":Telescope live_grep <CR>"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"
-- dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
