-- Neovim Core Options
-- Converted from init.vim set commands and let g: variables

-- Set up vim and nvim compatibility paths
vim.opt.runtimepath:prepend('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')
vim.opt.packpath = vim.o.runtimepath

-- Basic settings
vim.opt.compatible = false -- Not compatible with vi
vim.opt.termguicolors = true -- Enable 24-bit RGB colors

-- Enable filetype detection, plugins, and indent
vim.cmd('filetype indent plugin on')

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Display settings
vim.opt.number = true -- Display line numbers
vim.opt.ruler = true -- Show cursor position
vim.opt.showcmd = true -- Show partial commands in status line
vim.opt.laststatus = 2 -- Always display status line
vim.opt.cmdheight = 2 -- Command window height
vim.opt.signcolumn = 'number' -- Merge signcolumn with number column

-- Search settings
vim.opt.hlsearch = true -- Highlight search results
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Unless search has capital letters

-- Editing behavior
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.backspace = { 'indent', 'eol', 'start' } -- Allow backspacing over everything
vim.opt.autoindent = true -- Keep indent when creating new line
vim.opt.startofline = false -- Don't move cursor to line start on buffer switch

-- Tab and indentation settings
vim.opt.shiftwidth = 2 -- Indent by 2 spaces
vim.opt.softtabstop = 2 -- Tab key indents by 2 spaces
vim.opt.expandtab = true -- Use spaces instead of tabs

-- User experience
vim.opt.wildmenu = true -- Enhanced command-line completion
vim.opt.confirm = true -- Ask to save instead of failing command
vim.opt.visualbell = true -- Use visual bell instead of beeping
-- Note: t_vb is Vim-only, not needed in Neovim
vim.opt.mouse = 'a' -- Enable mouse in all modes
vim.opt.updatetime = 300 -- Faster completion (default 4000ms)
vim.opt.shortmess:append('c') -- Don't pass messages to ins-completion-menu

-- Timeout settings
vim.opt.timeout = false -- Don't timeout on mappings
vim.opt.ttimeout = true -- Do timeout on keycodes
vim.opt.ttimeoutlen = 200 -- Wait up to 200ms for keycode sequence

-- Global variables (let g:)
vim.g.tex_flavor = 'latex' -- Treat .tex files as LaTeX
