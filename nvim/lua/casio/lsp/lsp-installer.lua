local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- Register a handler that will be called for all installed servers
-- Alternatively, you may also register handlers on specific server
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("casio.lsp.handlers").on_attach,
        capabilities = require("casio.lsp.handlers").capabilities,
    }

    -- Example custom settings for jsonls server
    --
    -- if server.name == "jsonls" then
        -- local jsonls_opts = require("user.lsp.settings.jsonls")
        -- opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    -- end
    --

    -- This setup() function is exactly the same as lspconfig's setup
    -- see github for reference
    server:setup(opts)
end)

