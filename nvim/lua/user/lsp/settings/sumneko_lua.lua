return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }, -- avoids the vim global keyword getting flagged everywhere
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}
