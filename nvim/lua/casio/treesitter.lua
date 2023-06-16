local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

local languages = {
	"bash",
	"c",
	"cmake",
	"comment",
	"commonlisp",
	"cpp",
	"css",
	"diff",
	"dockerfile",
	"dot",
	"fish",
	"git_rebase",
	"gitattributes",
	"gitignore",
	"go",
	"gomod",
	"gowork",
	"graphql",
	"hjson",
	"hlsl",
	"html",
	"http",
	"java",
	"javascript",
	"jsdoc",
	"json",
	"json5",
	"jsonnet",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"proto",
	"python",
	"regex",
	"ruby",
	"rust",
	"scss",
	"sql",
	"todotxt",
	"toml",
	"tsx",
	"vim",
	"vue",
	"yaml",
}

configs.setup {
    ensure_installed = languages, -- one of "all", "maintained" (parses with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to 'ensure_installed')
    -- ignore_install = { "" }, -- list of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        -- disable = { "" }, -- list of languages that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}

