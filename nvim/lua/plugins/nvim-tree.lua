local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create")) -- to create dir, just suffix with a '/'
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
	vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
end

local icons = require("config.icons")

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				width = 45,
				side = "left",
				number = false,
				relativenumber = false,
			},
			actions = {
				open_file = {
					quit_on_open = false,
				},
			},
			filters = {
				git_ignored = false,
				dotfiles = false,
				custom = {
					"^.git$", -- hide `.git` folder
				},
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			renderer = {
				highlight_git = true,
				icons = {
					git_placement = "before",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						git = true,
					},
					glyphs = {
						git = {
							unstaged = icons.git.FileUnstaged,
							staged = icons.git.FileStaged,
							unmerged = icons.git.FileUnmerged,
							renamed = icons.git.FileRenamed,
							untracked = icons.git.FileUntracked,
							deleted = icons.git.FileDeleted,
							ignored = icons.git.FileIgnored,
						},
					},
				},
			},
		})
	end,
}
