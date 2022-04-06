local fn = vim.fn
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

return packer.startup({
	function(use)
		use("wbthomason/packer.nvim")
		use("nvim-lua/plenary.nvim")
		use("nvim-lua/popup.nvim")
		use("EdenEast/nightfox.nvim")
		use("folke/tokyonight.nvim")
		use("moll/vim-bbye")
		use({
			"mvllow/modes.nvim",
			config = function()
				vim.opt.cursorline = true
				require("modes").setup({
					colors = {
						copy = "#49FF00",
						delete = "#FF2442",
						insert = "#F98404",
						visual = "#1FFFFF",
					},
					line_opacity = 0.1,
					set_cursor = true,
					focus_only = false,
				})
			end,
		})
		use("akinsho/bufferline.nvim") -- Statusline
		use("nvim-lualine/lualine.nvim") -- Statusline
		use("kyazdani42/nvim-web-devicons")
		use("goolord/alpha-nvim")
		use("rcarriga/nvim-notify")
		use("folke/which-key.nvim")
		use("windwp/nvim-autopairs")
		use("numToStr/Comment.nvim")
		use("karb94/neoscroll.nvim")
		use("akinsho/toggleterm.nvim")
		use("ahmedkhalf/project.nvim")
		use("lewis6991/impatient.nvim")
		use("kyazdani42/nvim-tree.lua")
		use({
			"antoinemadec/FixCursorHold.nvim",
			event = "BufRead",
			config = function()
				vim.g.cursorhold_updatetime = 500
			end,
		})
		use("lukas-reineke/indent-blankline.nvim")
		use("br1anchen/nvim-colorizer.lua") -- Colorizer
		use("hrsh7th/nvim-cmp") -- cmp plugins
		use("hrsh7th/cmp-path") -- path completions
		use("hrsh7th/cmp-emoji")
		use("hrsh7th/cmp-buffer") -- buffer completions
		use("hrsh7th/cmp-cmdline") -- cmdline completions
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-nvim-lua")
		use("saadparwaiz1/cmp_luasnip") -- snippet completions
		use("L3MON4D3/LuaSnip") --snippet engine
		use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
		use("filipdutescu/renamer.nvim")
		use("neovim/nvim-lspconfig") -- LSP
		use("folke/trouble.nvim")
		use("b0o/SchemaStore.nvim")
		use("ray-x/lsp_signature.nvim")
		use("tamago324/nlsp-settings.nvim")
		use("jose-elias-alvarez/null-ls.nvim")
		use("williamboman/nvim-lsp-installer")
		use("nvim-telescope/telescope.nvim") -- Telescope
		use("nvim-telescope/telescope-ui-select.nvim")
		use("tom-anders/telescope-vim-bookmarks.nvim")
		use("nvim-telescope/telescope-media-files.nvim")
		use("nvim-telescope/telescope-file-browser.nvim")
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Treesitter
		use("p00f/nvim-ts-rainbow")
		use("windwp/nvim-ts-autotag")
		use("nvim-treesitter/playground")
		use("romgrk/nvim-treesitter-context")
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use("lewis6991/gitsigns.nvim") -- Git
		use("github/copilot.vim") -- Git
		use("kdheepak/lazygit.nvim") -- Git
		use("folke/zen-mode.nvim") -- Zen-Mode
		use("folke/twilight.nvim") -- Zen-Mode
		use("RRethy/vim-illuminate")
		use("Mephistophiles/surround.nvim")

		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
