-- Custom keymaps, applied on LspAttach for LSP-dependent bindings

-- Telescope keymaps (defined here directly to avoid lazy.nvim key-spec merging issues)
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files", silent = true })
-- Remove LazyVim's <leader>b* sub-mappings so <leader>b fires unambiguously with notimeout
-- pcall(vim.keymap.del, "n", "<leader>bb")
-- pcall(vim.keymap.del, "n", "<leader>bd")
-- pcall(vim.keymap.del, "n", "<leader>bo")
-- pcall(vim.keymap.del, "n", "<leader>bD")
-- vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Find buffers", silent = true, nowait = true })
-- vim.keymap.set("n", "<leader>h", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files", silent = true })
-- vim.keymap.set("n", "<leader>r", "<cmd>Telescope live_grep<cr>", { desc = "Live grep", silent = true })
-- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags", silent = true })
-- vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands", silent = true })
-- vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps", silent = true })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers", silent = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local buf = args.buf
		local function map(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = buf, silent = true, desc = desc })
		end

		map("<C-j>", vim.diagnostic.goto_prev, "Previous diagnostic")
		map("<C-k>", vim.diagnostic.goto_next, "Next diagnostic")
	end,
})
