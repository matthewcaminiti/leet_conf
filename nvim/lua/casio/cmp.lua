local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load() -- required (unknown reason, see luasnip github)

local icons = require "casio.icons"

-- nerdfont icons: nerdfonts.com/cheat-sheet
local kind_icons = {
  Text = icons.kind.Text,
  Method = icons.kind.Method,
  Function = icons.kind.Function,
  Constructor = icons.kind.Constructor,
  Field = icons.kind.Field,
  Variable = icons.kind.Variable,
  Class = icons.kind.Class,
  Interface = icons.kind.Interface,
  Module = icons.kind.Module,
  Property = icons.kind.Property,
  Unit = icons.kind.Unit,
  Value = icons.kind.Value,
  Enum = icons.kind.Enum,
  Keyword = icons.kind.Keyword,
  Snippet = icons.kind.Snippet,
  Color = icons.kind.Color,
  File = icons.kind.File,
  Reference = icons.kind.Reference,
  Folder = icons.kind.Folder,
  EnumMember = icons.kind.EnumMember,
  Constant = icons.kind.Constant,
  Struct = icons.kind.Struct,
  Event = icons.kind.Event,
  Operator = icons.kind.Operator,
  TypeParameter = icons.kind.TypeParameter,
}

cmp.setup {
	preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- specific to Luasnip
        end,
    },
    mapping = {
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
	},
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
}
