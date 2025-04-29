vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {
			on_attach = function(bufnr)
				local function opts(desc)
					return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				local ok, api = pcall(require, "nvim-tree.api")
				assert(ok, "api module is not found")

				local function edit_or_open()
					local node = api.tree.get_node_under_cursor()
					if node.nodes ~= nil then
						-- expand or collapse folder
						api.node.open.edit()
					else
						-- open file
						api.node.open.edit()
						-- Close the tree if file was opened
						api.tree.close()
					end
				end

				-- open as vsplit on current node
				local function vsplit_preview()
					local node = api.tree.get_node_under_cursor()
					if node.nodes ~= nil then
						-- expand or collapse folder
						api.node.open.edit()
					else
						-- open file as vsplit
						api.node.open.vertical()
					end
						-- Finally refocus on tree if it was lost
						api.tree.focus()
				end

				-- ctrl+h toggles tree
				vim.keymap.set("n", "<CR>", api.node.open.tab_drop, opts("Tab drop"))

				-- l does the same as <Enter>
				vim.keymap.set("n", "l", edit_or_open,          opts("Edit Or Open"))

				-- not working?
				vim.keymap.set("n", "L", vsplit_preview,        opts("Vsplit Preview"))

				-- not working?
				vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))

			end,
		}


	end,
}

