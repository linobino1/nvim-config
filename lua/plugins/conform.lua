return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local util = require("conform.util")

		local prettier = {
			"prettierd",
			"prettier",
			stop_after_first = true,
		}
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = prettier,
				javascriptreact = prettier,
				typescript = prettier,
				typescriptreact = prettier,
				css = prettier,
				json = prettier,
				graphql = prettier,
				yaml = prettier,
			},
			formatters = {
				prettier = {
					-- Ensures Prettier runs from the project root
					cwd = util.root_file({ ".prettierrc", ".prettierrc.js", "package.json", ".git" }),
					-- Optional: specify command path if needed (e.g. to use project-local version)
					-- command = "npx prettier", -- uncomment if using npx for project-local Prettier
				},
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
