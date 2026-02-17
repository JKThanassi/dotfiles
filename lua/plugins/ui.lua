-- UI and Visual Enhancement Plugins
-- Colorscheme, statusline, icons, and visual improvements

return {
  -- Solarized8 colorscheme (neovim branch)
  {
    'lifepillar/vim-solarized8',
    branch = 'neovim',
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      vim.opt.background = 'light'
      vim.cmd('colorscheme solarized8')
    end,
  },

  -- Airline statusline
  {
    'vim-airline/vim-airline',
    lazy = false,
    dependencies = {
      'vim-airline/vim-airline-themes',
    },
    init = function()
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_theme = 'solarized'
      vim.g.airline_solarized_bg = 'light'
    end,
  },

  -- Airline themes
  {
    'vim-airline/vim-airline-themes',
    lazy = false,
  },

  -- Tmuxline integration (generates tmux statusline from vim-airline)
  {
    'edkolev/tmuxline.vim',
    lazy = false,
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
