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

-- Copy relative path of current buffer
vim.api.nvim_create_user_command("CopyBufPath", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
