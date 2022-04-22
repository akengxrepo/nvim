local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Quit & Save
keymap("n", "X", "<cmd>Bdelete!<CR>", opts)
keymap("n", "W", "<cmd>w<CR>", opts)
keymap("n", "Q", "<cmd>q<CR>", opts)
keymap("i", "<C-w>", "<Esc><cmd>w<CR>", opts)
keymap("i", "<C-q>", "<Esc><cmd>q<CR>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<A-Right>", ":bnext<CR>", opts)
keymap("n", "<A-Left>", ":bprevious<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)
keymap("n", "Z", "<cmd>ZenMode<cr>", opts)
keymap("v", "#", [[y?\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
keymap("v", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)

-- Enable/Disable Format on Save
keymap("n", "\\", "<cmd>Format<cr>", opts)
--
keymap("n", "<Esc>", ":noh<CR><Esc>", opts)
keymap("n", "<F2>", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<F3>", "<cmd>Telescope commands<cr>", opts)
keymap("n", "<F4>", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "<F6>", "<cmd>BufferLinePick<cr>", opts)
keymap(
	"n",
	"<F7>",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	opts
)
keymap("n", "<F8>", "<CMD>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("i", "<F8>", "<ESC><CMD>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("v", "<F8>", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)

keymap("n", "<A-t>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
