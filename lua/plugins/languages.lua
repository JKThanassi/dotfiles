-- Language-Specific Plugins
-- Tools and support for specific programming languages

return {
  -- LaTeX support
  {
    'lervag/vimtex',
    ft = { 'tex', 'latex' },
  },

  -- Haskell: hlint refactoring support
  {
    'mpickering/hlint-refactor-vim',
    ft = 'haskell',
  },

  -- Lisp: paredit for structured editing
  {
    'vim-scripts/paredit.vim',
    ft = { 'lisp', 'scheme', 'clojure' },
  },

  -- Markdown: vim-markdown with folding disabled
  {
    'plasticboy/vim-markdown',
    ft = 'markdown',
    dependencies = { 'godlygeek/tabular' },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },

  -- Markdown: instant preview
  {
    'instant-markdown/vim-instant-markdown',
    ft = 'markdown',
    build = 'yarn install',
  },

  -- Python: Black code formatter
  {
    'psf/black',
    ft = 'python',
  },
}
