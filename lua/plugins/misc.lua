-- Miscellaneous Plugins
-- Additional utilities and enhancements

return {
  -- Plenary: required by trouble and todo-comments
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },

  -- Trouble: pretty diagnostics and quickfix list
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'Trouble', 'TroubleToggle' },
    opts = {},
  },

  -- Todo Comments: highlight and search TODO comments
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},
  },

  -- Number Toggle: smart number toggling (relative/absolute)
  {
    'jeffkreeftmeijer/vim-numbertoggle',
    event = 'VeryLazy',
  },
}
