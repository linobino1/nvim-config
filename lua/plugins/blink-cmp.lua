return {
	"saghen/blink.cmp",
	version = "0.*",
	dependencies = {
		{
			--"rafamadriz/friendly-snippets",
			"giuxtaposition/blink-cmp-copilot",
		},
	},
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		sources = {
			default = {
				"copilot",
				"lazydev",
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
					transform_items = function(_, items)
						local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
						local kind_idx = #CompletionItemKind + 1
						CompletionItemKind[kind_idx] = "Copilot"
						for _, item in ipairs(items) do
							item.kind = kind_idx
						end
						return items
					end,
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
	opts_extend = { "sources.default" },
}
