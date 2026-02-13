-- Plugin Manager Bootstrap and Configuration
-- Using lazy.nvim for modern plugin management

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with all plugin modules
require("lazy").setup({
  -- Import all plugin configurations
  { import = "plugins.ui" },
  { import = "plugins.navigation" },
  { import = "plugins.lsp" },
  { import = "plugins.treesitter" },
  { import = "plugins.editing" },
  { import = "plugins.languages" },
  { import = "plugins.git" },
  { import = "plugins.tools" },
  { import = "plugins.misc" },
}, {
  -- Lazy.nvim configuration options
  checker = {
    enabled = false, -- Don't automatically check for plugin updates
  },
  performance = {
    rtp = {
      -- Disable some rtp plugins to speed up startup
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
