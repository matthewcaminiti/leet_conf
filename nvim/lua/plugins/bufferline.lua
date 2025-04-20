return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			always_show_bufferline = true,
			offsets = { { filetype = "NvimTree", text = "tree", padding = 0 } },
			diagnostics_update_in_insert = false,
			diagnostics = false, -- | "nvim_lsp" | "coc",
		},
		highlights = {
			-- use `:h bufferline-configuration` to see what highlights can play with
			-- can checkout highlights with `:hi <highlight name>`
			indicator_selected = {
				fg = "DodgerBlue",
				bg = { attribute = "bg", highlight = "Normal" },
			},
			modified_selected = {
				fg = "Yellow",
			},
			modified_visible = {
				fg = "Yellow",
			},
		},
	},
}
