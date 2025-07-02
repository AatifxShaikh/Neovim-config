return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html', -- needed for question rendering
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    lang = 'python3',
    'java', -- or "python3", "java", etc.

    cn = {
      enabled = false, -- use leetcode.com
      translator = true,
      translate_problems = true,
    },

    picker = {
      provider = 'telescope', -- or "fzf-lua", "snacks-picker"
    },

    plugins = {
      non_standalone = true, -- allow running even if other buffers are open
    },

    logging = true,
  },
}
