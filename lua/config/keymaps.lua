-- Custom keymaps, applied on LspAttach for LSP-dependent bindings

-- Telescope keymaps (defined here directly to avoid lazy.nvim key-spec merging issues)
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files", silent = true })
-- Remove LazyVim's <leader>b* sub-mappings so <leader>b fires unambiguously with notimeout
pcall(vim.keymap.del, "n", "<leader>bb")
pcall(vim.keymap.del, "n", "<leader>bd")
pcall(vim.keymap.del, "n", "<leader>bo")
pcall(vim.keymap.del, "n", "<leader>bD")
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Find buffers", silent = true, nowait = true })
vim.keymap.set("n", "<leader>h", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files", silent = true })
vim.keymap.set("n", "<leader>r", "<cmd>Telescope live_grep<cr>", { desc = "Live grep", silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags", silent = true })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands", silent = true })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps", silent = true })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = buf, silent = true, desc = desc })
    end

    map("gy", vim.lsp.buf.type_definition, "Go to type definition")
    map("<C-g>", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>f", vim.lsp.buf.format, "Format code")
    map("<leader>c", vim.lsp.buf.code_action, "Code action")
    map("<C-j>", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("<C-k>", vim.diagnostic.goto_next, "Next diagnostic")
    map("<C-F>", function()
      require("conform").format({ formatters = { "prettier" } })
    end, "Format with Prettier")
  end,
})
