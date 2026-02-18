-- UI and Visual Enhancement Plugins
-- Colorscheme, statusline, icons, and visual improvements

return {
  -- Tokyo Night colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    opts = {
      style = 'day', -- Use day variant
    },
    config = function()
      require('tokyonight').setup({
        style = 'day',
      })
      vim.cmd('colorscheme tokyonight')
    end,
  },

  -- Lualine statusline (modern, Lua-native)
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16, -- ~60fps
          events = {
            'WinEnter',
            'BufEnter',
            'BufWritePost',
            'SessionLoadPost',
            'FileChangedShellPost',
            'VimResized',
            'Filetype',
            'CursorMoved',
            'CursorMovedI',
            'ModeChanged',
          },
        }      },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      },
    },

    -- File icons (modern, nvim-tree requirement)
    {
      'nvim-tree/nvim-web-devicons',
      lazy = false,
    },

    -- Rainbow delimiters for matching parentheses
    {
      'hiphish/rainbow-delimiters.nvim',
      event = 'VeryLazy',
      config = function()
        local rainbow_delimiters = require('rainbow-delimiters')
        vim.g.rainbow_delimiters = {
          strategy = {
            [''] = rainbow_delimiters.strategy.global,
            vim = rainbow_delimiters.strategy['local'],
          },
          query = {
            [''] = 'rainbow-delimiters',
            lua = 'rainbow-blocks',
          },
          highlight = {
            'RainbowDelimiterRed',
            'RainbowDelimiterYellow',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterCyan',
          },
        }
      end,
    },
  }
