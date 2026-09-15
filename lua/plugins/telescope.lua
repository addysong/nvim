return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'echasnovski/mini.icons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            width = { padding = 3 },
            height = { padding = 2 },
            preview_cutoff = 80,
            preview_width = 0.5,
            prompt_position = 'bottom',
          },
        },
        border = true,
        selection_caret = '→ ',
        entry_prefix = '  ',
        prompt_prefix = ' ',
      },
      extensions = {
        fzf = { fuzzy = false },
      },
      pickers = {
        find_files = { follow = true },
        live_grep = {
          additional_args = function() return { '--follow' } end,
        },
        lsp_references = { show_line = false },
        lsp_definitions = { show_line = false },
        lsp_implementations = { show_line = false },
      },
    },
    config = function(_, opts)
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      -- LSP
      vim.keymap.set(
        'n',
        'grr',
        builtin.lsp_references,
        { desc = 'Goto references' }
      )
      vim.keymap.set(
        'n',
        'gri',
        builtin.lsp_implementations,
        { desc = 'Goto implementations' }
      )
      vim.keymap.set(
        'n',
        'grd',
        builtin.lsp_definitions,
        { desc = 'Goto definition' }
      )
      vim.keymap.set(
        'n',
        'grD',
        vim.lsp.buf.declaration,
        { desc = 'Goto declaration' }
      )
      vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { desc = 'LSP rename' })
      vim.keymap.set(
        'n',
        'gra',
        vim.lsp.buf.code_action,
        { desc = 'Code action' }
      )
      vim.keymap.set(
        'n',
        'gre',
        vim.diagnostic.open_float,
        { desc = 'Show code diagnostic (errors)' }
      )
      -- Telescope
      vim.keymap.set(
        'n',
        '<Leader>f',
        builtin.find_files,
        { desc = 'Search files' }
      )
      vim.keymap.set(
        'n',
        '<Leader>g',
        builtin.live_grep,
        { desc = 'Search grep' }
      )
      vim.keymap.set(
        'n',
        '<Leader>sb',
        builtin.buffers,
        { desc = 'Search buffers' }
      )
      vim.keymap.set(
        'n',
        '<Leader>sd',
        builtin.diagnostics,
        { desc = 'Search diagnostics' }
      )
      vim.keymap.set(
        'n',
        '<Leader>sh',
        builtin.help_tags,
        { desc = 'Search help tags' }
      )
      vim.keymap.set(
        'n',
        '<Leader>sm',
        builtin.marks,
        { desc = 'Search marks' }
      )
      vim.keymap.set(
        'n',
        '<Leader>sk',
        builtin.keymaps,
        { desc = 'Search keymaps' }
      )
      vim.keymap.set(
        'n',
        '<Leader>sv',
        builtin.git_status,
        { desc = 'Telescope git status' }
      )
      -- Search through hidden files
      vim.keymap.set(
        'n',
        '<leader>.f',
        function()
          builtin.find_files({
            hidden = true,
            no_ignore = true,
            follow = true,
          })
        end,
        { desc = 'Search files (+hidden)' }
      )
      vim.keymap.set('n', '<leader>.g', function()
        builtin.live_grep({
          additional_args = function()
            return { '--hidden', '--no-ignore', '--follow' }
          end,
        })
      end, { desc = 'Search grep (+hidden)' })

      telescope.setup(opts)
      telescope.load_extension('fzf')
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    opts = {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({}),
        },
      },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('ui-select')
    end,
  },
}
