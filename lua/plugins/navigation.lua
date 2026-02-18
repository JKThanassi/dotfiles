-- Navigation and File Finding Plugins
-- Modern file explorer and fuzzy finder

return {
  -- Neo-tree: modern file explorer (replaces NERDTree)
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle file explorer', silent = true },
      { '<leader>o', ':Neotree focus<CR>', desc = 'Focus file explorer', silent = true },
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          padding = 0,
        },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '',
        },
      },
      window = {
        position = 'left',
        width = 30,
        mappings = {
          ['<space>'] = 'none',
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = 'open_current',
        use_libuv_file_watcher = true,
      },
    },
  },

  -- Telescope: fuzzy finder with previews (replaces fzf)
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Optional: native fzf sorter for better performance
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    cmd = 'Telescope',
    keys = {
      -- File finding
      { '<C-p>', '<cmd>Telescope find_files<cr>', desc = 'Find files' },

      -- Buffer/history navigation
      { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
      { '<leader>h', '<cmd>Telescope oldfiles<cr>', desc = 'Recent files' },

      -- Live grep (replaces :Rg)
      { '<leader>r', '<cmd>Telescope live_grep<cr>', desc = 'Live grep' },

      -- Additional useful pickers
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help tags' },
      { '<leader>fc', '<cmd>Telescope commands<cr>', desc = 'Commands' },
      { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          prompt_prefix = '> ',
          selection_caret = '➜ ',
          path_display = { 'truncate' },
          sorting_strategy = 'ascending',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ['<esc>'] = actions.close,
            },
          },
          -- Disable treesitter highlighting in previewer to avoid compatibility issues
          preview = {
            treesitter = false,
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' },
          },
        },
      })

      -- Load fzf native extension for better performance
      require('telescope').load_extension('fzf')
    end,
  },
}
