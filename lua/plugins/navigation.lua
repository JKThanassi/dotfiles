-- Navigation and File Finding Plugins
-- NERDTree and FZF for file navigation

return {
  -- NERDTree file explorer
  {
    'scrooloose/nerdtree',
    cmd = 'NERDTree',
    config = function()
      -- NERDTree with file icons configuration
      vim.g.WebDevIconsOS = 'Darwin'
      vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
      vim.g.DevIconsEnableFoldersOpenClose = 1
      vim.g.DevIconsEnableFolderExtensionPatternMatching = 1
    end,
  },

  -- FZF fuzzy finder (binary)
  {
    'junegunn/fzf',
    build = './install --bin',
  },

  -- FZF vim integration
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    keys = {
      { '<C-p>', ':Files<CR>', desc = 'Find files' },
      { '<leader>b', ':Buffers<CR>', desc = 'Find buffers' },
      { '<leader>h', ':History<CR>', desc = 'File history' },
      { '<leader>r', ':Rg<CR>', desc = 'Ripgrep search' },
    },
  },
}
