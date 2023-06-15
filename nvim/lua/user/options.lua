-- :help options
vim.opt.mouse = "a"		    -- enable mouse support
vim.opt.expandtab = true	-- convert tabs to spaces
vim.opt.shiftwidth = 4		-- the number of spaces inserted for each indentation
vim.opt.tabstop = 4		    -- insert 4 spaces for a tab
vim.opt.showtabline = 2		-- show tabs for files at the top of the screen
vim.opt.syntax = "on"		-- syntax babyyy
vim.opt.cursorline = true	-- highlight current line
vim.opt.smartindent = true	-- smart indent you fucko
vim.opt.showmatch = true	-- show matching pairs of brackets
vim.opt.ignorecase = true	-- enable smartcase search sensitivity
vim.opt.smartcase = true	-- enable smartcase search sensitivity
vim.opt.relativenumber = true	-- show line numbers relative to cursor location
vim.opt.nu = true		    -- show line numbers
vim.opt.hlsearch = false	-- always unhighlight after search
vim.opt.hidden = true		-- keeps buffers hidden in the background
vim.opt.errorbells = false	-- no bellz
vim.opt.wrap = false		-- no rapping
vim.opt.swapfile = false	-- no swapfile
vim.opt.backup = false		-- no backup
-- vim.opt.undodir = "~/.vim/undodir"
vim.opt.undofile = true		-- enable persistent undo
vim.opt.splitright = true	-- vsplit to right always
vim.opt.splitbelow = true	-- split to bottom always
vim.opt.updatetime = 100	-- faster completion (4000ms default)
vim.opt.incsearch = true	-- show search matches as the search query is being typed
vim.opt.scrolloff = 12		-- pad cursor from window top and bottom
vim.opt.sidescrolloff = 8	-- pad cursor from window left and right
vim.opt.colorcolumn = "100"	-- formatting column in editor
vim.opt.cmdheight = 2		-- height of command pane
vim.opt.signcolumn = "yes"	-- margin to the left, good for linting
vim.opt.termguicolors = true	-- enables ="true" color support
vim.cmd [[autocmd BufWinEnter,BufNewFile,BufRead * setlocal formatoptions-=cro]] -- prevent comment blocks continuing on new line (:help fo-table)

--vim.cmd [[set nohlsearch=true]] -- always unhighlighht after search
vim.cmd [[set iskeyword+=-]]	-- sets strings like "user-button" to be considered 1 word for say 'dw'
vim.cmd [[highlight Cursorline cterm=NONE ctermbg=black ctermfg=NONE]]  -- set cursorline highlighting
vim.cmd [[highlight CursorLineNR cterm=NONE]] -- remove cursorline underline from number column
