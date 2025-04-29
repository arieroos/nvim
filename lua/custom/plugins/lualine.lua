return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      globalstatus = true,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_y = {
        function()
          local cur_line = vim.fn.line '.'
          local col = vim.fn.charcol '.'
          local location = string.format('%d:%d', cur_line, col)
          local total = vim.fn.line '$'
          local progress = (cur_line == 1 and 'Top' or cur_line == total and 'Bot') or string.format('%d%%%%', math.floor(cur_line / total * 100))
          return string.format('%s (%s)', location, progress)
        end,
      },
      lualine_z = {
        function()
          return os.date '%a %H:%M:%S'
        end,
      },
    },
  },
}
