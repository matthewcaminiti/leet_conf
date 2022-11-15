local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load() -- required (unknown reason, see luasnip github)

-- nerdfont icons: nerdfonts.com/cheat-sheet
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
	preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- specific to Luasnip
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- navigate up through completions
        ["<C-j>"] = cmp.mapping.select_next_item(), -- navigate down through completions
        ["<C-e>"] = cmp.mapping { -- to close completions window
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = false }, -- ENTER to select completion ONLY if something is explicitly selected (set to true otherwise)
        ["<Tab>"] = cmp.mapping.select_next_item(), -- navigate down through completions
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- navigate up through completions
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                luasnip = "[Snippet]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = { -- the order in which completions will show up, given their source
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "path" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
		--[[ documentation = { ]]
		--[[ 	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, ]]
		--[[ }, ]]
	},
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
}
