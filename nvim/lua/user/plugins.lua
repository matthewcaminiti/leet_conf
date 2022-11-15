local fn = vim.fn

-- Automatically install packer (if not installed already)
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer...close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- User a protected call so we don't error out on first user
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install plugins
return packer.startup(function(use)
    -- Plugin list
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs, {}, [], (), "", ''
    use "numToStr/Comment.nvim" -- Easily comment stuff
    use "kyazdani42/nvim-web-devicons" -- stuff for icons and things
    use "kyazdani42/nvim-tree.lua" -- sexy file explorer
	use "akinsho/bufferline.nvim" -- buffer tabs at the top
	use "moll/vim-bbye" -- sum ting

    -- Markdown preview with :MarkdownPreview command
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview', ft = 'markdown'}

    -- Colorschemes
    -- use "lunarvim/colorschemes" -- a bunch of colorschemes (most notable 'darkplus')
	use "lunarvim/darkplus.nvim"
    use "sainnhe/sonokai" -- sonokai colorscheme
    use "folke/tokyonight.nvim" -- tokyonight colorscheme
	use "gruvbox-community/gruvbox" -- GRUVBOX COMMUNITY AYYO

    -- Completion plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp" -- lsp completion

    -- Snippets
    use "L3MON4D3/LuaSnip" -- Snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "simrat39/rust-tools.nvim"

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
		commit = "9bfaf62e42bdcd042df1230e9188487e62a112c0",
        run = ":TSUpdate", -- auto update
    }
    use "JoosepAlviste/nvim-ts-context-commentstring" -- know what comment string to use based on file

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Automatically set up your config after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
