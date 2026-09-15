return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local lualine = require('lualine')

    local function file_icon()
      local ok, icons = pcall(require, 'mini.icons')
      if not ok then return '' end
      return (icons.get('file', vim.fn.expand('%:t')))
    end

    local function file_icon_color()
      local ok, icons = pcall(require, 'mini.icons')
      if not ok then return {} end
      local _, hl = icons.get('file', vim.fn.expand('%:t'))
      return hl
    end

    local function indent_component()
      if not vim.bo.expandtab then return ' tab' end
      return '󱁐 ' .. vim.bo.tabstop
    end

    local function project_dir()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    end

    local winbar_components = {
      lualine_c = {
        {
          file_icon,
          color = file_icon_color,
          padding = { left = 1, right = 0 },
        },
        {
          'filename',
          path = 1,
          file_status = true,
          newfile_status = true,
          symbols = {
            modified = '󰲶 ',
            readonly = ' ',
            unnamed = '[Unnamed]',
            newfile = ' ',
          },
        },
        {
          'location',
          color = 'Comment',
          padding = 0,
        },
        { 'progress', color = 'Comment' },
      },
    }

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {
          { 'mode', color = { gui = 'bold' } },
        },
        lualine_b = { 'lsp_status', 'diagnostics' },
        lualine_c = {},
        lualine_x = {
          { indent_component, color = 'Comment' },
          {
            'fileformat',
            symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' },
            color = 'Comment',
          },
          { 'encoding', color = 'Comment' },
        },
        lualine_y = {
          'diff',
          { 'branch', fmt = function(s) return s:match('[^/]+$') or s end },
        },
        lualine_z = { project_dir },
      },
      winbar = winbar_components,
      inactive_winbar = winbar_components,
      tabline = {},
      extensions = {},
    })
  end,
}
