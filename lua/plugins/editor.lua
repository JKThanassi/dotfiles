return {
  -- Neo-tree: add <leader>o for focus; LazyVim already provides <leader>e for toggle
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>o", ":Neotree focus<CR>", desc = "Focus file explorer", silent = true },
    },
    opts = {
      window = {
        width = 30,
        mappings = { ["<space>"] = "none" },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
      },
    },
  },

  -- Telescope: replace LazyVim's <leader>f* keymaps with our preferred bindings
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- Remove LazyVim's <leader>f* telescope keymaps
      { "<leader>ff", false },
      { "<leader>fF", false },
      { "<leader>fb", false },
      { "<leader>fg", false },
      { "<leader>fr", false },
      { "<leader>fR", false },
      -- Custom keymaps are defined directly in config/keymaps.lua
    },
    opts = {
      defaults = {
        prompt_prefix = "> ",
        selection_caret = "➜ ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
            ["<esc>"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
        preview = { treesitter = false },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        },
      },
    },
  },
}
