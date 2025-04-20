return {
	"lewis6991/gitsigns.nvim",
	opts = {
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 0,
			ignore_whitespace = false,
			relative_time = false,
		},
		current_line_blame_formatter = '<author>, [<author_time:%a, %b %d %Y %H:%M>] - "<summary>"',
	},
}
