return {
  'rcarriga/nvim-notify',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  opts = {
    render = 'wrapped-compact',
    stages = 'static',
    top_down = false,
    timeout = 2500,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { border = 'rounded' })
    end,
  },
  config = function(_, opts)
    require('notify').setup(opts)
    vim.notify = require('notify')

    local telescope = require('telescope')
    telescope.load_extension('notify')
    vim.keymap.set(
      'n',
      '<Leader>sn',
      telescope.extensions.notify.notify,
      { desc = 'Search marks' }
    )
  end,
}
