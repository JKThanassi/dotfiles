-- Language-specific plugins not covered by LazyVim extras
-- (vimtex, black, vim-markdown covered by lang.tex, lang.python, lang.markdown extras)

return {
  -- Haskell: hlint refactoring support
  {
    "mpickering/hlint-refactor-vim",
    ft = "haskell",
  },

  -- Lisp: paredit for structured editing
  {
    "vim-scripts/paredit.vim",
    ft = { "lisp", "scheme", "clojure" },
  },
}
