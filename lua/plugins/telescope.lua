return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-ui-select.nvim',
    },
    cmd = 'Telescope',
    keys = function()
      local ok, builtin = pcall(require, 'telescope.builtin')
      if not ok then
        return {}
      end

      return {
        { '<leader>ff', function() builtin.find_files({}) end },
        { '<leader>fg', function() builtin.live_grep({}) end },
        { '<leader>fb', function() builtin.buffers({}) end },
        { '<leader>fh', function() builtin.help_tags({}) end },
      }
    end,
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          }
        }
      })

      telescope.load_extension('ui-select')
    end
  },
}
