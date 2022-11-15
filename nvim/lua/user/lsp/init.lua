local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

local function on_attach(client, buffer)
end

local opts = {
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},
	server = {
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy",
				}
			}
		}
	}
}

require("user.lsp.lsp-installer")
require("rust-tools").setup(opts)
require("user.lsp.handlers").setup()
