return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				lua_ls = {},
				ts_ls = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")

			local on_attach = function(client, bufnr)
				local _opts = { silent = true, noremap = true }
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", _opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", _opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", _opts)
			end
			for server, config in pairs(opts.servers) do
				-- this might not be required if neovim > 0.11:
				-- https://cmp.saghen.dev/installation.html#lsp-capabilities
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

				if not config.on_attach then
					config.on_attach = on_attach
				end

				lspconfig[server].setup(config)
			end
		end,
	},
}
