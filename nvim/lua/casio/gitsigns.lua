local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

local icons = require "casio.icons"

local on_attach = function(bufnr) 
    local gs = package.loaded.gitsigns

    opts = opts or {}
    opts.buffer = bufnr
    opts.noremap = true
    opts.silent = true

    vim.keymap.set('n', "gb", gs.toggle_current_line_blame)
    vim.keymap.set('n', "<leader>hd", gs.diffthis)
end

gitsigns.setup {
    on_attach = on_attach,
    signs = {
        add = { hl = "GitSignsAdd", text = icons.ui.BoldLineMiddle, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = icons.ui.BoldLineDashedMiddle, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = icons.ui.TriangleShortArrowRight, numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = icons.ui.TriangleShortArrowRight, numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = icons.ui.BoldLineMiddle, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_file = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, [<author_time:%a, %b %d %Y %H:%M>] - \"<summary>\"",
    current_line_blame_formatter_opts = {
        relative_time = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
    yadm = {
        enable = false,
    },
}
