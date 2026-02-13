-- Neovim Autocommands
-- Converted from init.vim autocmd statements

-- Set .env.local files to use shell syntax highlighting
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".env.local",
  callback = function()
    vim.bo.syntax = "sh"
  end,
  desc = "Set syntax for .env.local files",
})

-- SCSS filetype: include @-@ in keyword characters for CSS variables
vim.api.nvim_create_autocmd("FileType", {
  pattern = "scss",
  callback = function()
    vim.opt_local.iskeyword:append("@-@")
  end,
  desc = "Add @-@ to keywords for SCSS files",
})
