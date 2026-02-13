-- Editing Enhancement Plugins
-- Simple text manipulation and editing tools

return {
  -- Surround text objects with quotes, parentheses, etc.
  -- Commands: cs, ds, ys
  {
    'tpope/vim-surround',
    event = 'VeryLazy',
  },

  -- Comment/uncomment code easily
  -- Commands: gcc (line), gc (with motion), gc (visual)
  {
    'tpope/vim-commentary',
    event = 'VeryLazy',
  },

  -- Align text by patterns
  -- Commands: :Tabularize
  {
    'godlygeek/tabular',
    cmd = 'Tabularize',
  },
}
