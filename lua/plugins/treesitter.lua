return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		-- Treesitter
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"cpp",
				"python",
				"latex",
				"bash",
				"json",
				"yaml",
				"html",
				"css",
				"javascript",
				"typescript",
				"rust",
				"go",
				"java",
				"toml",
				"jsonc",
				"cmake",
				"dockerfile",
				"regex",
				"query",
				"tsx",
				"vue",
				"yaml",
			},
			highlight = {
				enable = false,
			},
			indent = {
				enable = true,
			},
			auto_install = true,
		})
	end,
}
