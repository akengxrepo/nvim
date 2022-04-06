local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menu", "menuone", "noselect" },
	conceallevel = 0,
	cursorline = true,
	expandtab = true,
	fileencoding = "utf-8",
	foldenable = false,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	hidden = true,
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	number = true,
	relativenumber = false,
	numberwidth = 4,
	pumheight = 10,
	ruler = true,
	shiftround = true,
	shiftwidth = 2,
	showmode = false,
	showtabline = 2,
	scrolloff = 2,
	sidescrolloff = 2,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	switchbuf = "useopen,usetab,newtab",
	tabstop = 2,
	termguicolors = true,
	timeoutlen = 300,
	title = true,
	undofile = true,
	undolevels = 2000,
	updatetime = 300,
	visualbell = true,
	writebackup = false,
	wrap = false,
	confirm = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c")
vim.cmd([[set whichwrap+=<,>,[,],h,l]])
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])

vim.cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

if has('persistent_undo')
  let target_path = expand('~/.config/vim-persisted-undo/')
  if !isdirectory(target_path)
      call system('mkdir -p ' . target_path)
  endif
  let &undodir = target_path
  set undofile
endif
]])
