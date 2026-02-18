-- Options that differ from LazyVim defaults

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.opt.cmdheight = 2         -- LazyVim default is 1
vim.opt.signcolumn = "number" -- Merge sign column with number column (LazyVim default is "yes")
vim.opt.numberwidth = 1       -- Minimum width; expands only as needed for digit count
vim.opt.timeout = false       -- Don't timeout on mappings
vim.opt.ttimeout = true       -- Do timeout on keycodes
vim.opt.ttimeoutlen = 200     -- Wait up to 200ms for keycode sequence

vim.g.tex_flavor = "latex"    -- Treat .tex files as LaTeX

-- Check nearest package.json / tsconfig.json before asking LSP — avoids monorepo root bleed
vim.g.root_spec = { { "package.json", "tsconfig.json", ".git", "lua" }, "lsp", "cwd" }
