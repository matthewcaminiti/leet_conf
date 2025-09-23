return {
	"echasnovski/mini.statusline",
	version = false,
	config = function()
		local statusline = require("mini.statusline")

		statusline.setup({
			content = {
				active = function()
					local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
					local filename = statusline.section_filename({ trunc_width = 140 })
					local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
					local location = statusline.section_location({ trunc_width = 75 })
					local search = statusline.section_searchcount({ trunc_width = 75 })

					return statusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						"%<", -- Mark general truncate point
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=", -- End left alignment
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
						{ hl = mode_hl, strings = { search, location } },
					})
				end,
			},
		})
	end,
}
