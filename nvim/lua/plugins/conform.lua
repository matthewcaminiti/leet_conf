return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier", stop_after_first = true },
			javascriptreact = { "prettier", stop_after_first = true },
			typescript = { "prettier", stop_after_first = true },
			typescriptreact = { "prettier", stop_after_first = true },
			html = { "prettier", stop_after_first = true },
			json = { "prettier", stop_after_first = true },
			markdown = { "prettier", stop_after_first = true },
			sh = { "beautysh", stop_after_first = true },
			rust = { "rustfmt", stop_after_first = true },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
