-- LSP Configuration via COC.nvim
-- Language Server Protocol support with auto-completion

return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- COC-specific options (moved from core/options.lua)
      vim.opt.updatetime = 300 -- Faster completion
      vim.opt.shortmess:append('c') -- Don't pass messages to completion menu

      -- Sign column configuration
      if vim.fn.has('nvim-0.5.0') == 1 or vim.fn.has('patch-8.1.1564') == 1 then
        vim.opt.signcolumn = 'number' -- Merge signcolumn with number column
      else
        vim.opt.signcolumn = 'yes'
      end

      -- Helper function to check if cursor is after whitespace
      local function check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      -- Keymaps

      -- COC Prettier formatting
      vim.keymap.set('n', '<C-F>', ':CocCommand prettier.formatFile<CR>', { silent = true, desc = 'Format file with Prettier' })

      -- Tab for completion navigation
      vim.keymap.set('i', '<Tab>', function()
        if vim.fn['coc#pum#visible']() ~= 0 then
          return vim.fn['coc#pum#next'](1)
        elseif check_back_space() then
          return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
        else
          return vim.fn['coc#refresh']()
        end
      end, { expr = true, silent = true, desc = 'Completion: next item or trigger' })

      -- Enter to confirm completion
      vim.keymap.set('i', '<CR>', function()
        if vim.fn['coc#pum#visible']() ~= 0 then
          return vim.fn['coc#_select_confirm']()
        else
          return vim.api.nvim_replace_termcodes('<C-g>u<CR>', true, true, true)
        end
      end, { expr = true, silent = true, desc = 'Completion: confirm selection' })

      -- Trigger completion with Ctrl+Space
      if vim.fn.has('nvim') == 1 then
        vim.keymap.set('i', '<C-space>', 'coc#refresh()', { expr = true, silent = true, desc = 'Trigger completion' })
      else
        vim.keymap.set('i', '<C-@>', 'coc#refresh()', { expr = true, silent = true, desc = 'Trigger completion' })
      end

      -- Show documentation in preview window
      local function show_documentation()
        local filetype = vim.bo.filetype
        if vim.tbl_contains({ 'vim', 'help' }, filetype) then
          vim.cmd('h ' .. vim.fn.expand('<cword>'))
        elseif vim.fn['coc#rpc#ready']() then
          vim.fn.CocActionAsync('doHover')
        else
          vim.cmd('!' .. vim.o.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
        end
      end

      vim.keymap.set('n', 'K', show_documentation, { silent = true, desc = 'Show documentation' })

      -- Float window scrolling (COC popups)
      if vim.fn.has('nvim-0.4.0') == 1 or vim.fn.has('patch-8.2.0750') == 1 then
        -- Normal mode
        vim.keymap.set('n', '<C-f>', function()
          if vim.fn['coc#float#has_scroll']() ~= 0 then
            return vim.fn['coc#float#scroll'](1)
          else
            return vim.api.nvim_replace_termcodes('<C-f>', true, true, true)
          end
        end, { expr = true, silent = true, nowait = true, desc = 'Scroll float window down' })

        vim.keymap.set('n', '<C-b>', function()
          if vim.fn['coc#float#has_scroll']() ~= 0 then
            return vim.fn['coc#float#scroll'](0)
          else
            return vim.api.nvim_replace_termcodes('<C-b>', true, true, true)
          end
        end, { expr = true, silent = true, nowait = true, desc = 'Scroll float window up' })

        -- Insert mode
        vim.keymap.set('i', '<C-f>', function()
          if vim.fn['coc#float#has_scroll']() ~= 0 then
            return vim.api.nvim_replace_termcodes('<C-r>=coc#float#scroll(1)<CR>', true, true, true)
          else
            return vim.api.nvim_replace_termcodes('<Right>', true, true, true)
          end
        end, { expr = true, silent = true, nowait = true, desc = 'Scroll float window down' })

        vim.keymap.set('i', '<C-b>', function()
          if vim.fn['coc#float#has_scroll']() ~= 0 then
            return vim.api.nvim_replace_termcodes('<C-r>=coc#float#scroll(0)<CR>', true, true, true)
          else
            return vim.api.nvim_replace_termcodes('<Left>', true, true, true)
          end
        end, { expr = true, silent = true, nowait = true, desc = 'Scroll float window up' })

        -- Visual mode
        vim.keymap.set('v', '<C-f>', function()
          if vim.fn['coc#float#has_scroll']() ~= 0 then
            return vim.fn['coc#float#scroll'](1)
          else
            return vim.api.nvim_replace_termcodes('<C-f>', true, true, true)
          end
        end, { expr = true, silent = true, nowait = true, desc = 'Scroll float window down' })

        vim.keymap.set('v', '<C-b>', function()
          if vim.fn['coc#float#has_scroll']() ~= 0 then
            return vim.fn['coc#float#scroll'](0)
          else
            return vim.api.nvim_replace_termcodes('<C-b>', true, true, true)
          end
        end, { expr = true, silent = true, nowait = true, desc = 'Scroll float window up' })
      end

      -- LSP Navigation keymaps
      vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true, desc = 'Go to definition' })
      vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true, desc = 'Go to type definition' })
      vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true, desc = 'Go to implementation' })
      vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true, desc = 'Show references' })

      -- LSP Actions
      vim.keymap.set('n', '<C-g>', '<Plug>(coc-rename)', { silent = true, desc = 'Rename symbol' })
      vim.keymap.set('n', '<leader>f', '<Plug>(coc-format)', { silent = true, desc = 'Format code' })
      vim.keymap.set('n', '<leader>c', '<Plug>(coc-codeaction)', { silent = true, desc = 'Code action' })

      -- Diagnostics navigation
      vim.keymap.set('n', '<C-j>', '<Plug>(coc-diagnostic-prev)', { silent = true, desc = 'Previous diagnostic' })
      vim.keymap.set('n', '<C-k>', '<Plug>(coc-diagnostic-next)', { silent = true, desc = 'Next diagnostic' })
    end,
  },
}
