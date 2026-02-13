-- Git Integration Plugins
-- Version control and git workflow tools

return {
  -- Fugitive: comprehensive git integration
  -- Commands: :Git, :Gwrite, :Gread, :Gdiff, :Gblame, etc.
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gwrite', 'Gread', 'Gdiff', 'Gblame', 'Gstatus' },
  },
}
