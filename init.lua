-- Neovim Configuration Entry Point
-- Main init.lua for dotfiles

-- Leader key uses Vim default: \ (backslash)
-- No need to set explicitly

-- Load core configuration
require('core.options')
require('core.keymaps')
require('core.autocmds')

-- Bootstrap and load plugins
require('plugins')
