return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      disable_hint = true,
      kind = "split",
    },
    config = true,
    keys = {
      { "<leader>gs", ":Neogit<cr>", desc = "Neogit" },
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        vim.keymap.set('n', '<leader>gb', function() gs.blame_line({ full = true }) end,
          { buffer = buffer, desc = 'Blame Line' })
      end,
    }
  },
}
