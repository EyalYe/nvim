return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
        ensure_installed = {
          "lua",
          "python",
          "pyright",
          "typescript",
          "html",
          "css",
          "json",
          "bash",
          "dockerfile",
          "vim",
          "yaml",
          "c",
          "rust",
          "clang",
          "codelldb",
        },
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"tsserver",
					"html",
					"cssls",
					"jsonls",
					"bashls",
					"dockerls",
					"vimls",
					"yamlls",
					"clangd",
					"rust_analyzer",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({
        capabilities = capabilities,
      })
			lspconfig.pyright.setup({ capabilities = capabilities})
			lspconfig.tsserver.setup({ capabilities = capabilities})
			lspconfig.html.setup({ capabilities = capabilities})
			lspconfig.cssls.setup({ capabilities = capabilities})
			lspconfig.jsonls.setup({ capabilities = capabilities})
			lspconfig.bashls.setup({ capabilities = capabilities})
			lspconfig.dockerls.setup({ capabilities = capabilities})
			lspconfig.vimls.setup({ capabilities = capabilities})
			lspconfig.yamlls.setup({ capabilities = capabilities})
			lspconfig.lua_ls.setup({ capabilities = capabilities})
			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
