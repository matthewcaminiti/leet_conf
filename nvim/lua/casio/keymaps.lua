local opts = { noremap = true, silent = true}

local term_ops = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--      normal_mode = "n",
--      insert_mode = "i",
--      visual_mode = "v",
--      visual_block_mode = "x",
--      term_mode = "t",
--      command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Open file explorer (<CR> is carriage return)(Lex is shorthand for left explore)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Delete buffer
keymap("n", "<leader>w", ":BufferLinePickClose<CR>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope git_files<cr>", opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

-- Visual --
-- Stay in indent mode when shifting lines
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

