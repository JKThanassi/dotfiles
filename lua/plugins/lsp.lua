return {
  -- Override vtsls root_dir using nvim 0.11's async API so it anchors at the nearest
  -- package.json / tsconfig.json, preventing tsconfig "extends" chains from climbing
  -- up to the monorepo root.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          -- root_dir = function(bufnr, on_dir)
          --   local root = vim.fs.root(bufnr, { "package.json", "tsconfig.json", "jsconfig.json" })
          --   if root then
          --     on_dir(root)
          --   end
          -- end,
          root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
        },
        eslint = {
          root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr, { "package.json", ".eslintrc.js", ".eslintrc.cjs", "eslint.config.mjs", "eslint.config.js" })
            if root then
              on_dir(root)
            end
          end,
        },
      },
    },
  },

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
