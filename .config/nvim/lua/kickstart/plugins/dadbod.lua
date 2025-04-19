return {
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
    config = function()
      vim.g.db_ui_use_nerd_fonts = vim.g.have_nerd_font
      vim.keymap.set('n', '<leader>db', ':DBUIToggle<CR>', { desc = 'Toggle [DB] UI' })
    end,
  },
}
