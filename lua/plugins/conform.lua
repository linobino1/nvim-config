return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local prettier = { "prettierd", "prettier", stop_after_first = true }
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = prettier,
				css = prettier,
				json = prettier,
				graphql = prettier,
				yaml = prettier,
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
