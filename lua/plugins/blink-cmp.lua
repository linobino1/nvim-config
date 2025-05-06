return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		{
			--"rafamadriz/friendly-snippets",
			"giuxtaposition/blink-cmp-copilot",
		},
	},
	opts = {
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		-- TODO: install the rust implementation https://cmp.saghen.dev/configuration/fuzzy.html
		fuzzy = { implementation = "lua" },
	},
}
