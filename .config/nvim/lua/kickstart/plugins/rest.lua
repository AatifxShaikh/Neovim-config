return {
  {
    'rest-nvim/rest.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local ok, rest = pcall(require, 'rest-nvim')
      if not ok then
        vim.notify('rest.nvim failed to load: ' .. tostring(rest), vim.log.levels.ERROR)
        return
      end
      rest.setup {
        result = {
          split = {
            horizontal = false,
            in_place = false,
            stay_in_current_window_after_split = true,
          },
          show_url = true,
          show_curl_command = true,
          show_headers = true,
          show_statistics = false,
          formatters = {
            json = 'jq',
            html = function(body)
              return vim.fn.system({ 'tidy', '-i', '-q', '--show-body-only', 'yes' }, body)
            end,
          },
        },
        highlight = {
          enable = true,
          timeout = 750,
        },
        skip_ssl_verification = false,
      }
      vim.keymap.set('n', '<leader>rr', ':Rest run<CR>', { desc = '[R]un [R]equest under cursor' })
      vim.keymap.set('n', '<leader>rl', ':Rest last<CR>', { desc = '[R]un [L]ast request' })
      vim.keymap.set('n', '<leader>ro', ':Rest open<CR>', { desc = '[R]equest [O]pen result pane' })
    end,
  },
}
