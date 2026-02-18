return {
  -- Configure prettier formatting for web file types
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
      },
    },
  },

  -- Configure blink.cmp completion keymaps (Tab, CR, C-space)
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      },
    },
  },
}
